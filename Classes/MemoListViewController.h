//
//  MemoListViewController.h
//  iphone
//
//  Created by 인철 백 on 10. 9. 5..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Article;

@interface MemoListViewController : UITableViewController {
	
	NSArray *memolistData;
	Article *_article;
}

@property (nonatomic, retain) NSArray *memolistData;
@property (nonatomic, retain) Article *article;

//- (IBAction)replyWriteAction:(id)sender;

@end
