//
//  MemoListViewController.m
//  iphone
//
//  Created by 인철 백 on 10. 9. 5..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "MemoListViewController.h"
#import "MemoTableViewCell.h"
#import "BoardService.h"

@implementation MemoListViewController
@synthesize memolistData;
@synthesize article = _article;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	NSLog(@"_article.seq %d", _article.seq);

	self.memolistData = [NSArray arrayWithArray:[BoardService selectMemoListOfSeq:_article.seq]];
	for (Memo *item in self.memolistData) {
		NSLog(@"%@", item);
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
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.memolistData count];
}


// Customize the appearance of table view cells.
static NSString *CellIdentifier = @"MemoTableViewCell";

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {  
    
    MemoTableViewCell *cell = (MemoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"MemoTableViewCell" owner:nil options:nil];
		cell = [arr objectAtIndex:0];
    }

	[cell setMemo:[self.memolistData objectAtIndex:indexPath.row]];
	
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	Memo *memo = [self.memolistData objectAtIndex:indexPath.row];

	CGSize size = [memo.userId sizeWithFont:[UIFont systemFontOfSize:MEMO_CELL_SUB_FONT_SIZE] 
						  constrainedToSize:CGSizeMake(MEMO_CELL_WIDTH, 480.0f)];
	
//	CGSize size2 = [memo.wtime sizeWithFont:[UIFont systemFontOfSize:MEMO_CELL_SUB_FONT_SIZE] 
//						  constrainedToSize:CGSizeMake(MEMO_CELL_WIDTH, 480.0f)];
	
	CGSize size3 = [memo.bcomment sizeWithFont:[UIFont systemFontOfSize:MEMO_CELL_FONT_SIZE] 
							 constrainedToSize:CGSizeMake(MEMO_CELL_WIDTH, 480.0f)];
	
	return size.height + MEMO_CONTENT_MARGIN_TOP + size3.height + MEMO_CELL_PADDING * 2;
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
	self.memolistData = nil;
}


- (void)dealloc {
	[memolistData release];
	[_article release];
    [super dealloc];
}


@end

