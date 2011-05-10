//
//  BBSInfo.h
//  iphone
//
//  Created by insford on 10. 8. 22..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BBSInfo : NSObject {
	NSString *_bbs;		// 영문이름 중요한거 
	NSString *_name;	// 한글네임
	NSString *_header;	// 모르겠음
	NSString *_cseq;	// code 별의미없음 
	int _searchCount;
	NSInteger	_bookmark;	// 즐겨찾기 유무
	NSInteger _ord;			// 즐겨찾기 정렬순
}
@property (nonatomic, retain) NSString *bbs;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *header;
@property (nonatomic, retain) NSString *cseq;
@property (nonatomic, assign) int searchCount;
@property (nonatomic, assign) NSInteger bookmark;
@property (nonatomic, assign) NSInteger ord;

- (id) initWithBbs:(NSString *) bbs name:(NSString *) name;
- (id) initWithBbsBookmark:(NSDictionary *)dict;

@end
