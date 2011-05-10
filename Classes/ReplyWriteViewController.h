//
//  ReplyWriteViewController.h
//  iphone
//
//  Created by KU AHN on 10. 8. 22..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ReplyWriteViewController : UIViewController {

	IBOutlet UITextField *replyWriteTextField;
	IBOutlet UIButton *replyWriteButton;
	
}

@property (retain, nonatomic) IBOutlet UITextField *replyWriteTextField;
@property (retain, nonatomic) IBOutlet UIButton *replyWriteButton;

@end
