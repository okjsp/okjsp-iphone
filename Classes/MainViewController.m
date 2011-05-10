//
//  MainViewController.m
//  iphone
//
//  Created by 인철 백 on 10. 8. 8..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController 
@synthesize bannerIsVisible, tableView, sectionList, sectionDataList;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	//iAD 코드 추가
	adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
	adView.frame = CGRectOffset(adView.frame, 0, 368);
	adView.requiredContentSizeIdentifiers = [NSSet setWithObject:ADBannerContentSizeIdentifier320x50];
	adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
	[self.view addSubview:adView];
	adView.delegate=self;
	self.bannerIsVisible=NO;
	//iAD 코드 추가 끝

	sectionList = [[NSArray alloc] initWithObjects:[[BBSInfo alloc] initWithBbs:@"notice" name:@"공지사항"],
					[[BBSInfo alloc] initWithBbs:@"html5" name:@"html5"], nil];
	
	//self.sectionDataList = [BoardService selectMainArticleList];
	sectionDataList = [[NSArray alloc] initWithObjects:
							[BoardService selectArticleListOfBbs:@"notice" startRow:1 endRow:5],
							[BoardService selectArticleListOfBbs:@"html5" startRow:1 endRow:5], nil];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	NSArray *array = [BoardService selectBBSInfoList];
	NSLog(@"array size=%d", [array count]);
	
	for (int i = 0; i < [array count]; i++) {
		NSLog(@"log=%@", [array objectAtIndex:i]);
	}
	
	NSArray *memoList = [BoardService selectMemoListOfSeq:153141];
	NSLog(@"memoList size=%d", [memoList count]);
	
	for (int i = 0; i < [memoList count]; i++) {
		NSLog(@"log=%@", [memoList objectAtIndex:i]);
	}
}

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


#pragma mark -
#pragma mark Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
	return [sectionDataList count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	BBSInfo *bbsInfo = [sectionList objectAtIndex:section];
	return bbsInfo.name;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[sectionDataList objectAtIndex:section] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	NSArray *boardList = [sectionDataList objectAtIndex:indexPath.section];
	Article *article = [boardList objectAtIndex:indexPath.row];
	cell.textLabel.text = [article subject];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	
	//BoardService 호출 샘플
/*
	NSArray *list = [BoardService selectArticleListOfBbs:@"test" startRow:1 endRow:10];
	for (int i = 0; i < [list count]; i++) {
		Article *article = [list objectAtIndex:i];
		NSLog(@"article.subject=%@", [article subject]);
		NSLog(@"article.content=%@", [article content]);
		NSLog(@"article.writer=%@", [article writer]);
	}
*/
	ArticleDetailViewController *toPush = [[ArticleDetailViewController alloc] initWithNibName:@"ArticleDetailViewController" bundle:nil];
	toPush.title = @"글 보기";
	toPush.article = [[self.sectionDataList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	[self.navigationController pushViewController:toPush animated:YES];

}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	
	self.tableView = nil;
	adView = nil;
	self.sectionDataList = nil;
	self.sectionList = nil;
}


- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
	if (!self.bannerIsVisible)
	{
		NSLog(@"bannerViewDidLoadAd");
		[UIView beginAnimations:@"animateAdBannerOn" context:NULL];
		// banner is invisible now and moved out of the screen on 50 px
		banner.frame = CGRectOffset(banner.frame, 0, -50);
		[UIView commitAnimations];
		self.bannerIsVisible = YES;
	}
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
	if (self.bannerIsVisible)
	{
		NSLog(@"didFailToReceiveAdWithError");
		[UIView beginAnimations:@"animateAdBannerOff" context:NULL];
		// banner is visible and we move it out of the screen, due to connection issue
		banner.frame = CGRectOffset(banner.frame, 0, 50);
		[UIView commitAnimations];
		self.bannerIsVisible = NO;
	}
}

- (void)dealloc {
	[tableView release];
	[adView release];
	[sectionDataList release];
	[sectionList release];
    [super dealloc];
}


@end

