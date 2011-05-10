//
//  ArticleListViewController.m
//  iphone
//
//  Created by 인철 백 on 10. 8. 8..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "ArticleListViewController.h"

@implementation ArticleListViewController
@synthesize articleListData, bbsInfo;

#pragma mark -
#pragma mark lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil  bundle:nibBundleOrNil]) {
		// nothing
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

	// TODO
	/*
	UIBarButtonItem *bookmarkButton = [[UIBarButtonItem alloc] initWithTitle:@"글쓰기" 
																	   style:UIBarButtonItemStylePlain
																	  target:self action:@selector(writeAction:)];
	self.navigationItem.rightBarButtonItem = bookmarkButton;
	*/
	
	self.articleListData = [NSArray arrayWithArray:[BoardService selectArticleListOfBbs:bbsInfo.bbs startRow:0 endRow:2]];
	self.title = bbsInfo.name;
	
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.articleListData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSUInteger row = [indexPath row];
	Article *article = [articleListData objectAtIndex:row];
    cell.textLabel.text = article.subject;
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	ArticleDetailViewController *toPush = [[ArticleDetailViewController alloc] initWithNibName:@"ArticleDetailViewController" bundle:nil];
	toPush.title = @"글 보기";
	
	Article *article = [articleListData objectAtIndex:indexPath.row];
	toPush.article = article;
	[self.navigationController pushViewController:toPush animated:YES];
}

- (IBAction)writeAction:(id)sender {
	ArticleWriteViewController *toPush = [[ArticleWriteViewController alloc] initWithNibName:@"ArticleWriteViewController" bundle:nil];
	toPush.title = @"글 쓰기";
	[self.navigationController pushViewController:toPush animated:YES];
}

#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.articleListData= nil;
	self.bbsInfo = nil;
}	

- (void)dealloc {
	[articleListData release];
	[bbsInfo release];
    [super dealloc];
}

@end