//
//  MemoTableViewCell.m
//  iphone
//
//  Created by bic on 10. 9. 16..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "MemoTableViewCell.h"
#import "Memo.h"

@implementation MemoTableViewCell

@synthesize replyUserNameLabel, replyWriteDateLabel;
@synthesize replyContentLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setMemo:(Memo *)memo {
	
	// replyUserName
	replyUserNameLabel.text = memo.userId;
	replyUserNameLabel.font = [UIFont systemFontOfSize:MEMO_CELL_SUB_FONT_SIZE];
	replyUserNameLabel.textColor = [UIColor grayColor];
	CGSize size = [replyUserNameLabel.text sizeWithFont:[UIFont systemFontOfSize:MEMO_CELL_SUB_FONT_SIZE] constrainedToSize:CGSizeMake(MEMO_CELL_WIDTH, 480.0f)];
	replyUserNameLabel.frame = CGRectMake(MEMO_CELL_PADDING_LEFT, MEMO_CELL_PADDING, MEMO_CELL_WIDTH, size.height);
	
	// replyWriteDate
	NSArray *array = [memo.wtime componentsSeparatedByString:@"T"];		// YYYY-MM-DD 만 추출
	replyWriteDateLabel.text = [NSString stringWithFormat:@" | %@", [array objectAtIndex:0]];
	replyWriteDateLabel.font = [UIFont systemFontOfSize:MEMO_CELL_SUB_FONT_SIZE];
	CGSize size2 = [replyWriteDateLabel.text sizeWithFont:[UIFont systemFontOfSize:MEMO_CELL_SUB_FONT_SIZE] constrainedToSize:CGSizeMake(MEMO_CELL_WIDTH, 480.0f)];
	replyWriteDateLabel.frame = CGRectMake(MEMO_CELL_PADDING_LEFT + size.width + 5, MEMO_CELL_PADDING, MEMO_CELL_WIDTH, size2.height);
	
	// replyContent
	replyContentLabel.text = memo.bcomment;
	CGSize size3 = [replyContentLabel.text sizeWithFont:[UIFont systemFontOfSize:MEMO_CELL_FONT_SIZE] constrainedToSize:CGSizeMake(MEMO_CELL_WIDTH, 480.0f)];	
	replyContentLabel.frame = CGRectMake(MEMO_CELL_PADDING_LEFT, MEMO_CELL_PADDING + MEMO_CONTENT_MARGIN_TOP + size2.height, MEMO_CELL_WIDTH, size3.height);

	//UIImageView *replyUserPhotoImageView=(UIImageView *)[cell viewWithTag:1];
	//replyUserPhotoImageView.image=[];	
	
	// TODO 이미지 추가
	// 이미지를 비동기 커넥션을 사용하여 Lazy Loading하셔야 합니다
	// 개발자 센터의 LazyTableImages 샘플코드를 참조해 보세요.
}

- (void)dealloc {
	[replyUserNameLabel release];
	[replyWriteDateLabel release];
	[replyContentLabel release];
    [super dealloc];
}

@end
