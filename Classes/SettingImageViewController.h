//
//  SettingImageViewController.h
//  iphone
//
//  Created by 정부 윤 on 10. 8. 16..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingImageViewController : UIViewController <UIActionSheetDelegate , UINavigationControllerDelegate , UIImagePickerControllerDelegate>
{
	IBOutlet UIImageView *imageView;
	IBOutlet UIButton *uploadBtn;
	IBOutlet UIButton *selectBtn;
	
}

- (void)viewDidLoad;
- (IBAction) OnButtonDown : (id) sender;
- (IBAction) showActionSheet:(id)sender;

@end
