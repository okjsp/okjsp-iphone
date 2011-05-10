//
//  SettingMainViewController.h
//  iphone
//
//  Created by 인철 백 on 10. 8. 8..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingImageViewController.h"
#import "MemberService.h"


@interface SettingMainViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource> {
	NSDictionary *names;
    NSArray *keys;
	
	UITextField *textField;
	UITextField *textField2;
}
@property (nonatomic,retain) NSDictionary *names;
@property (nonatomic,retain) NSArray *keys;

@end
