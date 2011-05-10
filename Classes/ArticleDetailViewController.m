//
//  ArticleDetailViewController.m
//  iphone
//
//  Created by KU AHN on 10. 8. 22..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "ArticleDetailViewController.h"


@implementation ArticleDetailViewController
@synthesize articledetailTextView, replyListViewButton, articleUserPhotoImageView, articleTitleLabel, articleUserNameLabel, articleWriteDateLabel;
@synthesize article = _article;

- (void)viewDidLoad {
	[super viewDidLoad];

	articledetailTextView.editable = NO;
	
	_seq = _article.seq;
	_article = [BoardService selectArticleOfSeq:_seq];
	[_article retain];
	NSLog(@"%@", _article);
	
	articledetailTextView.text = _article.content;
	articledetailTextView.font = [UIFont systemFontOfSize:ARTICLE_FONT_SIZE];
								  
	articleTitleLabel.text = _article.subject;
	articleUserNameLabel.text = _article.writer;
	CGSize size = [articleUserNameLabel.text sizeWithFont:[UIFont systemFontOfSize:ARTICLE_SUB_FONT_SIZE] constrainedToSize:CGSizeMake(320.0f, 480.0f)];
	articleUserNameLabel.frame = CGRectMake(7, 32, size.width, size.height);
	
	NSArray *array = [_article.when componentsSeparatedByString:@"T"];		// YYYY-MM-DD 만 추출
	articleWriteDateLabel.text = [NSString stringWithFormat:@" | %@", [array objectAtIndex:0]];
	CGSize size2 = [articleWriteDateLabel.text sizeWithFont:[UIFont systemFontOfSize:ARTICLE_SUB_FONT_SIZE] constrainedToSize:CGSizeMake(320.0f, 480.0f)];
	articleWriteDateLabel.frame = CGRectMake(7 + size.width, 32, size2.width, size2.height);
	
	[replyListViewButton setTitle:[NSString stringWithFormat:@"댓글 보기 (%d)", _article.memo] forState:UIControlStateNormal];
	[replyListViewButton setTitle:[NSString stringWithFormat:@"댓글 보기 (%d)", _article.memo] forState:UIControlStateHighlighted];
}

- (IBAction)replyListViewAction:(id)sender {
	
	MemoListViewController *toPush = [[MemoListViewController alloc] initWithNibName:@"MemoListViewController" bundle:nil];
	toPush.title = @"댓글 보기";	

	Article *article = [[Article alloc] init];
	article.seq = _seq;
	toPush.article = article;
	[article release];
	
	NSLog(@"%@", _article);
	
	[self.navigationController pushViewController:toPush animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)viewDidUnload {
	_article = nil;
    self.articledetailTextView = nil;
	self.replyListViewButton = nil;
	self.articleUserPhotoImageView = nil;
	self.articleTitleLabel = nil;
	self.articleUserNameLabel = nil;
	self.articleWriteDateLabel = nil;	
	[super viewDidUnload];
	
}

- (void)dealloc {
	[_article release];
	[articledetailTextView release];
	[replyListViewButton release];
	[articleUserPhotoImageView release];
    [articleTitleLabel release];
	[articleUserNameLabel release];
	[articleWriteDateLabel release];
	[super dealloc];
}
@end
