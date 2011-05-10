//
//  BoardListViewController.h
//  iphone
//
//  Created by 인철 백 on 10. 8. 8..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleListViewController.h"
#import "iphoneAppDelegate.h"

@interface BoardListViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
	NSMutableArray *boardlistData;
	NSMutableArray *bookmarkBoardList;
	iphoneAppDelegate *appDelegate;
	int selectedSegment;
}

@property (nonatomic, retain) NSMutableArray *boardlistData;
@property (nonatomic, retain) iphoneAppDelegate *appDelegate;

- (IBAction)rightAction:(UIButton*)sender;
- (IBAction)segmentAction:(id)sender;

@end