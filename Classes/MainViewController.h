//
//  MainViewController.h
//  iphone
//
//  Created by 인철 백 on 10. 8. 8..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "ArticleListViewController.h"
#import "BoardService.h"
#import "MemberService.h"

@interface MainViewController : UIViewController <ADBannerViewDelegate, UITableViewDelegate, UITableViewDataSource> {
	IBOutlet UITableView *tableView;
	ADBannerView *adView;
	NSArray *sectionDataList;	//데이터<NsMutableArray<Article>> 리스트 
	NSArray *sectionList;		//섹션<Board> 리스트 
	BOOL bannerIsVisible;
}
@property(retain, nonatomic) IBOutlet UITableView *tableView;
@property(retain, nonatomic) NSArray *sectionDataList;
@property(retain, nonatomic) NSArray *sectionList;
@property (nonatomic,assign) BOOL bannerIsVisible;

@end
