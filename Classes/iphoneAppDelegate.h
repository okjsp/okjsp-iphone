//
//  iphoneAppDelegate.h
//  iphone
//
//  Created by 인철 백 on 10. 8. 8..
//  Copyright 2010 okjsp iphone 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	<sqlite3.h>
#import "Member.h"
#import "BoardService.h"

@interface iphoneAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
	
	sqlite3 *database;
	sqlite3_stmt *update_statement;
	
	NSMutableArray *articles;
	Member *userAccount;
	
	NSMutableArray *saveBoardList;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@property (nonatomic, retain) NSMutableArray *articles;
@property (nonatomic, retain) NSMutableArray *saveBoardList;
@property (nonatomic, retain) Member *userAccount;

- (BOOL)updateBoardBookmark:(NSString*)bbs value:(NSInteger)newValue;
- (BOOL)updateUserAccount:(NSString*)userid value:(NSString*)passwd;
- (BOOL)writeBoardList:(NSArray*)data;
- (BOOL)writePlist:(id)plist toFile:(NSString *)path;
@end
