//
//  ReplyTableViewCell.m
//  iphone
//
//  Created by KU AHN on 10. 8. 29..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "ReplyTableViewCell.h"


@implementation ReplyTableViewCell
@synthesize replyUserPhotoImageView, replyUserNameLabel, replyWriteDateLabel, replyContentTextView;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
