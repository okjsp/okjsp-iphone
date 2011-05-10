//
//  ReplyTableViewCell.h
//  iphone
//
//  Created by KU AHN on 10. 8. 29..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ReplyTableViewCell : UITableViewCell {
	IBOutlet UIImageView *replyUserPhotoImageView;
	IBOutlet UILabel *replyUserNameLabel;
	IBOutlet UILabel *replyWriteDateLabel;
	IBOutlet UITextView *replyContentTextView;
}

@property (retain, nonatomic) IBOutlet UIImageView *replyUserPhotoImageView;
@property (retain, nonatomic) IBOutlet UILabel *replyUserNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *replyWriteDateLabel;
@property (retain, nonatomic) IBOutlet UITextView *replyContentTextView;

@end
