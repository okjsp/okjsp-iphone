//
//  ArticleListViewController.h
//  iphone
//
//  Created by 인철 백 on 10. 8. 8..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleWriteViewController.h"
#import "ArticleDetailViewController.h"
#import "BoardService.h"

@interface ArticleListViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
	NSArray *articleListData;
	BBSInfo *bbsInfo;
}

@property (nonatomic, retain) NSArray *articleListData;
@property (nonatomic, retain) BBSInfo *bbsInfo;

- (IBAction)writeAction:(id)sender;

@end
