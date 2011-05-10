//
//  SettingMainViewController.m
//  iphone
//
//  Created by 인철 백 on 10. 8. 8..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "SettingMainViewController.h"


@implementation SettingMainViewController

/*
@synthesize listItems;
@synthesize sectionItem;
*/

@synthesize names;
@synthesize keys;


- (void)viewDidLoad {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"settingData" ofType:@"plist"];
	
	//파일 담기
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.names = dict;
    [dict release];
    
    NSArray *array = [[names allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.keys = array;
    
    NSLog(@"keys count : %d",[keys count]);
    
    [super viewDidLoad];
	
	/*
	NSMutableArray* groupArray = [[NSMutableArray alloc] initWithObjects:@"Profile",@"푸쉬알람",@"드위터 계정연결",@"About",nil];
	NSMutableArray* itemArray = [[NSMutableArray alloc] initWithObjects:@"test1",@"test2",nil];
	
	
	self.sectionItem = groupArray;
	self.listItems = itemArray;
	
	[itemArray release];
	[groupArray release];
	*/
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [keys count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
    NSLog(@"key:%@ count: %d",key,nameSection.count);
	
	return [nameSection count];
	//return [listItems count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
	
	NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
	
	static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
		
    }

	/*
	static NSString *identifiner = @"SectionsTableIndetifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifiner];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifiner] autorelease];
    }
	*/
	
	if (indexPath.section == 0) {	//로그인 섹션
		if(indexPath.row == 0){
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			cell.detailTextLabel.text = @"UserId";
		} else if (indexPath.row == 1) {
			UISwitch *boolSwitch = [[UISwitch alloc]initWithFrame:CGRectZero];
			boolSwitch.on =  YES;
			[cell setAccessoryView:boolSwitch];
			[boolSwitch release];
		}
	} else if (indexPath.section == 1) {	//사진 섹션
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	} else if (indexPath.section == 3) {	// 프로그램 정보 섹션
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	
	
	/*
	if (indexPath.section == 0 && indexPath.row == 0) {
		NSLog(@"key:%@ count: %d",key,indexPath.row);
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.detailTextLabel.text = @"Default1";
	}else if ([key isEqualToString:@"로그인"] == YES && indexPath.row == 1) {
		//cell.textLabel.text = [nameSection objectAtIndex:row];
		UISwitch *boolSwitch = [[UISwitch alloc]initWithFrame:CGRectZero];
		boolSwitch.on =  YES;
		[cell setAccessoryView:boolSwitch];
		[boolSwitch release];
	}else if([key isEqualToString:@"사진"] == YES && indexPath.row == 0) {
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	*/
	cell.textLabel.text = [nameSection objectAtIndex:row];
    return cell;
}



#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {			//로그인 섹션
		if (indexPath.row == 0) {
			//[ToDo] 로그인 정보 확인 상세페이지 이동
			
			//SettingImageViewController *toPush = [[SettingImageViewController alloc] initWithNibName:@"SettingImageViewController" bundle:nil];
			//toPush.title = @"사진 업로드";
			//[self.navigationController pushViewController:toPush animated:YES];
			
			[MemberService loginWithUserId:@"coma333" password:@"coma1838" isSaveUserId:TRUE isAutoLogin:TRUE];
			//loginWithUserId
		}
	} else if (indexPath.section == 1) {	//사진 섹션
		if (indexPath.row == 0) {
			SettingImageViewController *toPush = [[SettingImageViewController alloc] initWithNibName:@"SettingImageViewController" bundle:nil];
			toPush.title = @"사진 업로드";
			[self.navigationController pushViewController:toPush animated:YES];
		}
	}
	
	/*
	NSUInteger section = [indexPath section];
	NSString *key = [keys objectAtIndex:section];
   
	// if([strText rangeOfString:@"mihr01"].length)  포함된 문자열 비교
	if([key isEqualToString:@"사진"] == YES && indexPath.row == 0){
		SettingImageViewController *toPush = [[SettingImageViewController alloc] initWithNibName:@"SettingImageViewController" bundle:nil];
		toPush.title = @"사진 업로드";
		[self.navigationController pushViewController:toPush animated:YES];
	}
	else if ([key isEqualToString:@"로그인"] == YES && indexPath.row == 0)
	{
		
		UIAlertView *prompt = [[UIAlertView alloc] initWithTitle:@"UserID and PassWord" 
														 message:@"\n\n\n" // 중요!! 칸을 내려주는 역할을 합니다.
														delegate:self 
											   cancelButtonTitle:@"Cancel"
											   otherButtonTitles:@"Enter", nil];
		
		textField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 50.0, 260.0, 25.0)]; 
		[textField setBackgroundColor:[UIColor whiteColor]];
		[textField setPlaceholder:@"UserId"];
		[prompt addSubview:textField]; 
		textField2 = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 85.0, 260.0, 25.0)]; 
		[textField2 setBackgroundColor:[UIColor whiteColor]];
		[textField2 setPlaceholder:@"password"];
		[textField2 setSecureTextEntry:YES];
		[prompt addSubview:textField2];
		// AlertView의 위치를 이동 시켜 줌.
		[prompt setTransform:CGAffineTransformMakeTranslation(0.0, 50.0)];
		[prompt show];
		[prompt release];
		
		// textfield에 커서를 보내고 키보드를 표시 해 줌.
		[textField becomeFirstResponder];
		
	}
	*/
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	NSString *key = [keys objectAtIndex:section];
    return key;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	self.names = nil;
    self.keys = nil;
	//self.listItems = nil;
	[super viewDidUnload];
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	
}


- (void)dealloc {
    [names release];
    [keys release];
	//[listItems release];
	[super dealloc];
}

/*
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return keys;
}
*/

@end

/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */
/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */