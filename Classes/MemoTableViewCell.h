//
//  MemoTableViewCell.h
//  iphone
//
//  Created by bic on 10. 9. 16..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Memo;

#define MEMO_CELL_WIDTH 290
#define MEMO_CELL_FONT_SIZE 14
#define MEMO_CELL_SUB_FONT_SIZE 13
#define MEMO_CELL_PADDING 8
#define MEMO_CELL_PADDING_LEFT 11
#define MEMO_CONTENT_MARGIN_TOP 3

@interface MemoTableViewCell : UITableViewCell {
	UILabel *replyUserNameLabel;
	UILabel *replyWriteDateLabel;
	UILabel *replyContentLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *replyUserNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *replyWriteDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *replyContentLabel;

- (void)setMemo:(Memo *)memo;

@end