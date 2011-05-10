//
//  ReplyWriteViewController.m
//  iphone
//
//  Created by KU AHN on 10. 8. 22..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "ReplyWriteViewController.h"


@implementation ReplyWriteViewController
@synthesize replyWriteTextField, replyWriteButton;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	CGRect newFrame = CGRectMake(5.0, 10.0, 310.0, 150.0);
	replyWriteTextField.frame = newFrame;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
