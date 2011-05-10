//
//  BoardListController.m
//  iphone
//
//  Created by KU AHN on 10. 7. 18..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "BoardListViewController.h"

@implementation BoardListViewController
@synthesize boardlistData, appDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil  bundle:nibBundleOrNil]) {
		// nothing
	}
	return self;
}

- (void)viewDidLoad {
	
	[super viewDidLoad];
	appDelegate = (iphoneAppDelegate *)[[UIApplication sharedApplication] delegate];

	NSMutableArray *array = [appDelegate saveBoardList];
	for (id *item in array) {
		NSLog(@"%@", item);
	}
	
	self.boardlistData = array;
    [array release];

	bookmarkBoardList = [[[NSMutableArray alloc] init] retain];
	
	// member userAccount test
//	Member *member = [appDelegate userAccount];
//	NSLog(@"member %@", member);	
//	[appDelegate updateUserAccount:@"bic" value:@"pass"];	
//	NSLog(@"member %@", [appDelegate userAccount]);	
//	member = [appDelegate userAccount];
//	NSLog(@"member %@", member);

	self.title = @"글 목록";
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	// toolbar 보이기
	//[self.navigationController setToolbarHidden:NO];
	//	[self setToolbarItems:items];
	
	// toolbar 상단으로 올리기
	//	CGRect toolbarRect = CGRectMake(0, 60, self.navigationController.toolbar.frame.size.width, self.navigationController.toolbar.frame.size.height); 
	//	self.navigationController.toolbar.frame = toolbarRect;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	if (selectedSegment == 0) {		
		// 자주가는 게시판
		if (section == 0) {
			
			// 자주가는 게시판은 새로 로딩한다
			[bookmarkBoardList removeAllObjects];
			// 메모리에 불려진 게시판 리스트에서 bookmark 설정되어 있는 것만 골라낸다.
			for (NSMutableDictionary *item in self.boardlistData) {
				if ( [item objectForKey:@"bookmark"] == [NSNumber numberWithInt:1]  ) {
					NSLog(@"%@", item);
					[bookmarkBoardList addObject:item];
				}
			}
			
			return [bookmarkBoardList count];
		}
		else {
			return 0;
		}		
	}
	else {
		// 전체 게시판
		if (section == 0) {
			return 0;
		}
		else {
			return [self.boardlistData count];
		}
	}

	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
    NSUInteger row = [indexPath row];
	BBSInfo *bbsinfo = nil;
	if (selectedSegment == 0) {
		bbsinfo = [[BBSInfo alloc] initWithBbsBookmark:[bookmarkBoardList objectAtIndex:row]];
	}
	else {
		bbsinfo = [[BBSInfo alloc] initWithBbsBookmark:[self.boardlistData objectAtIndex:row]];
	}
    cell.textLabel.text = bbsinfo.name;
	
	// bookmark button
	UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
	rightButton.tag = row; // section 이 없기 때문에 row 값으로 tag 를 설정한다.
	rightButton.frame = CGRectMake(260, 0, 40, 40);
	if (bbsinfo.bookmark) {
		[rightButton setImage:[UIImage imageNamed: @"bookmark_on.png"] forState:UIControlStateNormal];
	}
	else {
		[rightButton setImage:[UIImage imageNamed: @"bookmark_off.png"] forState:UIControlStateNormal];
	}
	[rightButton addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
	cell.accessoryView = rightButton;
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	ArticleListViewController *toPush = [[ArticleListViewController alloc] initWithNibName:@"ArticleListViewController" bundle:nil];
	toPush.title = @"글 목록";
	if (selectedSegment) {
		toPush.bbsInfo = [[BBSInfo alloc] initWithBbsBookmark:[self.boardlistData objectAtIndex:indexPath.row]];		
	}
	else {
		toPush.bbsInfo = [[BBSInfo alloc] initWithBbsBookmark:[bookmarkBoardList objectAtIndex:indexPath.row]];
	}
	NSLog(@"toPush.bbsInfo \n%@",toPush.bbsInfo);

	[self.navigationController pushViewController:toPush animated:YES];
}

// bookmark button Action
- (IBAction)rightAction:(UIButton*)sender {
	
	// Bookmark 값 변경
	NSMutableDictionary *item = (selectedSegment)?[self.boardlistData objectAtIndex:sender.tag]:[bookmarkBoardList objectAtIndex:sender.tag];
	NSInteger newValue = 0;
	newValue = ( [[item objectForKey:@"bookmark"] intValue] ) ? 0 : 1;
	[item setValue:[NSNumber numberWithInteger:newValue] forKey:@"bookmark"];
	
	// DB update
	NSLog(@"seq %d value %d ", sender.tag, newValue);
	[appDelegate updateBoardBookmark:[item objectForKey:@"bbs"] value:newValue]; 
	
	if (selectedSegment == 0) {
		if (newValue == 0) {
			[self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:sender.tag inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];	
			[self.tableView reloadData];
		}
		else {
			// 발생하지 않음
		}
	}
	else {
		[self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:sender.tag inSection:1]] withRowAnimation:UITableViewRowAnimationFade];
	}
}

- (IBAction)segmentAction:(id)sender {
	
	NSLog(@"스크롤 중인지 %d %@", self.tableView.dragging, self.tableView);
	
	if (self.tableView.dragging == 1){
		[self performSelector:@selector(segmentAction:) withObject:sender afterDelay:0.1];
	}
	else {
		UISegmentedControl *segmentControl = (UISegmentedControl *)sender;
		selectedSegment = [segmentControl selectedSegmentIndex];

		[self.tableView beginUpdates];
		if (selectedSegment == 0) {
			[self.tableView deleteSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationTop];
			[self.tableView insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];	
		}
		else {
			[self.tableView deleteSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
			[self.tableView insertSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationTop];
		}
		[self.tableView endUpdates];
	}
}

#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    self.boardlistData = nil;
    [super viewDidUnload];
}

- (void)dealloc {	
    [boardlistData release];
	[bookmarkBoardList release];
    [super dealloc];
}

@end