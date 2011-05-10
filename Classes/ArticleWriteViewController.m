//
//  ArticleWriteViewController.m
//  iphone
//
//  Created by 인철 백 on 10. 8. 8..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "ArticleWriteViewController.h"


@implementation ArticleWriteViewController

@synthesize titleTextField, contentTextField, boardSelectButton, boardPicker, boardPickerBarButton;

- (IBAction)boardSelected:(id)sender {
	boardPicker.hidden=NO;
	boardPickerBar.hidden=NO;
}

- (IBAction)boardPickerBarButtonEvent:(id)sender {
	[boardSelectButton setTitle:[boardList objectAtIndex:[boardPicker selectedRowInComponent:0]] forState:UIControlStateNormal];
	boardPicker.hidden=YES;
	boardPickerBar.hidden=YES;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [boardList count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [boardList objectAtIndex:row];
}

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	boardPicker.hidden=YES;
	boardPickerBar.hidden=YES;
	
    boardList = [[NSArray alloc] initWithObjects: 
					  @"HTML5",
					  @"TECH TREND",
					  @"강좌",
					  @"개발툴",
					  @"개발툴 QnA",
					  @"Ajax",
					  @"Ajax QnA",
					  @"DB Tips",
					  @"DB QnA",
					  @"JSP Tips",
					  @"JSP QnA",
					  @"j2ee Tips",
					  @"j2ee QnA",
					  @"XML Tips",
					  @"XML QnA",
					  @"Ruby on Rails",
					  @"Ruby on Rails QnA",
					  @"Flex",
					  @"Flex QnA",
					  @"소스자료실",
					  @"문서자료실",
					  @"기타자료실",
					  @"사는 얘기",
					  @"일본사는얘기",
					  @"머리식히는 곳",
					  @"movie story",
					  @"얼마면돼",
					  @"의견좀...",
					  @"뉴스따라잡기",
					  @"싱글의 미학",
					  @"구인/구직/홍보",
					  @"english bbs",
					  @"번역",
					  @"추천사이트",
					  @"좋은회사",
					  @"장터",
					  @"모델2JSP책관련",
					  @"공지사항",
					  @"자료실문답",
					  @"유용한 정보",
					  @"맥 정보",
					  @"정부는 개발자를 위해",
					  @"프로그램기초스터디",
					  @"자바패턴1기",
					  @"DB스터디",
					  @"스프링 스터디",
					  @"SLF",
					  @"트위터",
					  @"짬통", nil];
	
	// write form text field height size
	CGRect newFrame = CGRectMake(5.0, 50.0, 310.0, 250.0);
	contentTextField.frame = newFrame; 
	
	// write navi done button
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"완료" 
																	   style:UIBarButtonItemStylePlain
																  target:self action:@selector(writeAction:)];
	self.navigationItem.rightBarButtonItem = doneButton;
	
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
			
- (void)dealloc {
	[boardPicker release];
	[boardList release];
    [super dealloc];
}

@end
