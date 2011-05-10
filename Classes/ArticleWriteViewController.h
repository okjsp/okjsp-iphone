//
//  ArticleWriteViewController.h
//  iphone
//
//  Created by 인철 백 on 10. 8. 8..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleWriteViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
	IBOutlet UITextField *titleTextField;
	IBOutlet UITextField *contentTextField;
	IBOutlet UIButton *boardSelectButton;
	IBOutlet UIPickerView *boardPicker;
	IBOutlet UIToolbar *boardPickerBar;
	IBOutlet UIBarButtonItem *boardPickerBarButton;
	NSArray* boardList;
}

@property (retain, nonatomic) IBOutlet UITextField *titleTextField;
@property (retain, nonatomic) IBOutlet UITextField *contentTextField;
@property (retain, nonatomic) IBOutlet UIButton *boardSelectButton;
@property (retain, nonatomic) IBOutlet UIPickerView *boardPicker;
@property (retain, nonatomic) IBOutlet UIToolbar *boardPickerBar;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *boardPickerBarButton;

- (IBAction)boardSelected:(id)sender;
- (IBAction)boardPickerBarButtonEvent:(id)sender;

@end
