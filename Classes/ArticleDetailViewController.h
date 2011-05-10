//
//  ArticleDetailViewController.h
//  iphone
//
//  Created by KU AHN on 10. 8. 22..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoardService.h"
#import "MemoListViewController.h"

#define ARTICLE_FONT_SIZE 14
#define ARTICLE_SUB_FONT_SIZE 13

@interface ArticleDetailViewController : UIViewController {
	IBOutlet UITextView *articledetailTextView;
	IBOutlet UIButton *replyListViewButton;
	IBOutlet UIImageView *articleUserPhotoImageView;
	IBOutlet UILabel *articleTitleLabel;
	IBOutlet UILabel *articleUserNameLabel;
	IBOutlet UILabel *articleWriteDateLabel;

	Article *_article;
	int _seq;
}

@property (retain, nonatomic) IBOutlet UITextView *articledetailTextView;
@property (retain, nonatomic) IBOutlet UIButton *replyListViewButton;
@property (retain, nonatomic) IBOutlet UIImageView *articleUserPhotoImageView;
@property (retain, nonatomic) IBOutlet UILabel *articleTitleLabel;
@property (retain, nonatomic) IBOutlet UILabel *articleUserNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *articleWriteDateLabel;

@property (nonatomic, retain) Article *article;

- (IBAction)replyListViewAction:(id)sender;

@end
