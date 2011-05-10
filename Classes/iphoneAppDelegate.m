//
//  iphoneAppDelegate.m
//  iphone
//
//  Created by 인철 백 on 10. 8. 8..
//  Copyright 2010 okjsp iphone 2010. All rights reserved.
//

#import "iphoneAppDelegate.h"

@interface iphoneAppDelegate (Private)
- (void)createEditableCopyOfDatabaseIfNeeded;
- (void)initializeDatabase;
@end

@implementation iphoneAppDelegate

@synthesize window, tabBarController;
@synthesize articles, userAccount, saveBoardList;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	[self createEditableCopyOfDatabaseIfNeeded];
	[self initializeDatabase];
	
    // Add the tab bar controller's view to the window and display.
    [window addSubview:tabBarController.view];
    [window makeKeyAndVisible];

    return YES;
}

- (void)createEditableCopyOfDatabaseIfNeeded {
	
	// sqlite
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);	
	NSString *documentsDirectory = [paths objectAtIndex:0];	
	NSString* myPath = [documentsDirectory stringByAppendingPathComponent:@"okjsp.sqlite"];
	
	NSLog(@"myPath is %@", myPath);
	
	// 파일이 Documents 에 존재하는지 확인.
	NSFileManager *fileManager = [NSFileManager defaultManager];
	BOOL exist = [fileManager fileExistsAtPath:myPath];
	if (exist) {
		NSLog(@"okjsp.sqlite 존재함");
		
		// test 용 덮어씌우기 
		//[fileManager removeItemAtPath:myPath error:NULL];
		
		// 실제 코드
		return;
	}	
	
	// 없으면 번들에서 복사
	NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"okjsp.sqlite"];
	NSError *error;
	exist = [fileManager copyItemAtPath:defaultDBPath toPath:myPath error:&error]; 
	if (!exist){
		NSAssert1(0, @"errrr '%@'. ", [error localizedDescription]);
	}
	NSLog(@"okjsp.sqlite 번들에서 복사");
	
}

#define BOARD_KEYS		[NSArray arrayWithObjects:@"bbs",@"name",@"bookmark",@"ord",nil]
/*
 * 서버로부터 게시판 리스트가 업데이트 되었는지 체크 후 디비에 덮어쓴다. 
 * 그리고 plist파일로부터 게시판 리스트를 읽어와 boards 에 담아둔다.
 */
- (void)initializeDatabase {

	// 서버로부터 게시판 리스트를 가져온다.
	NSMutableArray *boards = [NSMutableArray arrayWithArray:[BoardService selectBBSInfoList]];

	// TODO : 업데이트 되었는지 체크
	
	// boardList.plist 파일 읽어오기
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *boardListPath = [documentsDirectory stringByAppendingPathComponent:@"boardList.plist"];
//	NSMutableDictionary *plist = [NSDictionary dictionaryWithContentsOfFile: boardListPath]; 
	NSFileManager *fileManger = [NSFileManager defaultManager];

	// 서버로부터 가져온 게시판 리스트를 BOARD_KEYS 에 맞춰 NSDictionary 로 변환
	saveBoardList = [[[NSMutableArray alloc] init] retain];
	for (int i = 0; i < [boards count]; i++) {
		BBSInfo *bbsInfo = [boards objectAtIndex:i];
		// bbs, name, bookmark = 0, ord = 0
		NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:bbsInfo.bbs,bbsInfo.name,[NSNumber numberWithInteger:bbsInfo.bookmark],[NSNumber numberWithInteger:bbsInfo.ord], nil] 
														forKeys:BOARD_KEYS];
		[saveBoardList addObject:dic];
	}	
	
	// boardList.plist 없으면 새로 저장
	// 있으면 기존 값 유지하고 덮어쓰기
	if ( ![fileManger fileExistsAtPath:boardListPath] ) {

		BOOL re = [saveBoardList writeToFile:boardListPath atomically:YES];
		NSLog(@"파일 기록 성공 여부 : %@", (re?@"성공":@"실패"));
	}
	else {
		
		NSLog(@"boardList.plist 파일이 있습니다.");
		NSMutableArray *tempBoardList = [NSArray arrayWithContentsOfFile:boardListPath];
		for (int i = 0; i < [tempBoardList count]; i++) {
			NSMutableDictionary *dic = [tempBoardList objectAtIndex:i];
			
			for (NSMutableDictionary *item in saveBoardList) {
				if ( [[dic objectForKey:@"bbs"] isEqual:[item objectForKey:@"bbs"]]  ) {
					NSLog(@"%@ == %@", [dic objectForKey:@"bbs"], [item objectForKey:@"bbs"]);
					
					// 기존 bookmark, ord 값을 유지시킨다
					[item setValue:[dic objectForKey:@"bookmark"] forKey:@"bookmark"];
					[item setValue:[dic objectForKey:@"order"] forKey:@"order"];
					break;
				}
			}
		}
		BOOL re = [saveBoardList writeToFile:boardListPath atomically:YES];
		NSLog(@"파일 기록 성공 여부 : %@", (re?@"성공":@"실패"));
	}
}

- (Member*) userAccount {
	if (userAccount == nil){
		
		Member *member = [[Member alloc] init];
		
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		NSString* myPath = [documentsDirectory stringByAppendingPathComponent:@"okjsp.sqlite"];
		
		if (sqlite3_open([myPath UTF8String], &database) == SQLITE_OK) {
			NSLog(@"Database open OK : userAccount");
			
			const char *sql = 
			"SELECT userid, passwd FROM user ";
			sqlite3_stmt *statement = nil;
			
			NSLog(@"sql %s", sql);
			
			if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
				
				//sqlite3_bind_int(statement, 1, 1);
				while (sqlite3_step(statement) == SQLITE_ROW) {
					
					member.userId = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
					member.password = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
					
					NSLog(@"%d %@", [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)],  
						  [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)]);
				}
				
				userAccount = member;
				[member release];
			}
			else {
				
				//NSLog(@"prepare_v2 err %d", sqlite3_step(statement));
				NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
			}
			
			sqlite3_finalize(statement);
		}
		else{
			sqlite3_close(database);
			NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
		}	
	}
	return userAccount;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark UITabBarControllerDelegate methods

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


#pragma mark -
#pragma mark Database methods

// 게시판 즐겨찾기 update
- (BOOL)updateBoardBookmark:(NSString*)bbs value:(NSInteger)newValue {
	
	// 메모리에 불려진 값을 수정 후 
	for (NSMutableDictionary *item in saveBoardList) {
		if ( [[item	objectForKey:@"bbs"] isEqual:bbs]  ) {
			NSLog(@"%@ : %@", [item objectForKey:@"bbs"], item);
			
			// bookmark
			[item setValue:[NSNumber numberWithInteger:newValue] forKey:@"bookmark"];
			break;
		}
	}
	
	// 파일 저장
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *boardListPath = [documentsDirectory stringByAppendingPathComponent:@"boardList.plist"];
	BOOL re = [saveBoardList writeToFile:boardListPath atomically:YES];
	NSLog(@"파일 기록 성공 여부 : %@", (re?@"성공":@"실패"));
	return YES;
}

// 사용자 계정정보 update
- (BOOL)updateUserAccount:(NSString*)userid value:(NSString*)passwd {
	
	if (update_statement == nil) {
		const char *sql = "update user set userid = ?, passwd = ?";
		if (sqlite3_prepare_v2(database, sql, -1, &update_statement, NULL) != SQLITE_OK) {
			NSLog(@"Error : '%s'.", sqlite3_errmsg(database));
			return NO;
		}
	}
	sqlite3_bind_text(update_statement, 1, [userid UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(update_statement, 2, [passwd UTF8String], -1, SQLITE_TRANSIENT);
	int success = sqlite3_step(update_statement);
	sqlite3_reset(update_statement);
	
	if (success != SQLITE_DONE) {
		NSLog(@"Error : '%s'.", sqlite3_errmsg(database));
		return NO;
	}
	
	// TODO : passwd 암호화, 복호화
	
	return YES;
}
 
- (BOOL)writeBoardList:(NSArray*)data {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];		
	NSString* myPath = [documentsDirectory stringByAppendingPathComponent:@"boardList.plist"];

//	option = [NSMutableDictionary dictionaryWithObjects:data forKeys:OPTION_KEYS]; //[NSArray arrayWithObjects:optionData,nil];
	return [self writePlist:data toFile:myPath];		// option
}

- (BOOL)writePlist:(id)plist toFile:(NSString *)path { 
	NSString *error; 
	NSData *pData = [NSPropertyListSerialization dataFromPropertyList:plist 
															   format:NSPropertyListBinaryFormat_v1_0 
													 errorDescription:&error]; 
	if (!pData) { 
		NSLog(@"%@", error); 
		return NO; 
	} 
	return [pData writeToFile:path atomically:YES]; 
} 
			 
				 
#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [tabBarController release];
    [window release];
	[articles release];
	[userAccount release];
	[saveBoardList release];
    [super dealloc];
}

@end

