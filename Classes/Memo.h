//
//  Memo.h
//  iphone
//
//  Created by insford on 10. 8. 29..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 <bcomment>많이 바뀌었죠. CRUD도 annotation으로 할 수 있다는. 매우 편리하다는.</bcomment>
 <id>qpfmeksel1</id>
 <ip>59.5.46.186</ip>
 <mseq>447739</mseq>
 <seq>153141</seq>
 <writer>베르단디</writer>
 <wtime>2010-06-22T20:59:08+09:00</wtime>
 */
@interface Memo : NSObject {
	NSString *_userId;		//아이디
	NSString *_writer;		//닉네임?
	NSString *_wtime;		//작성시간
	NSString *_bcomment;	//커멘트
	int _mseq;				//메모 시퀀스
	int _seq;				//게시물 시퀀스
}
@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *writer;
@property (nonatomic, retain) NSString *wtime;
@property (nonatomic, retain) NSString *bcomment;
@property (nonatomic, assign) int mseq;
@property (nonatomic, assign) int seq;

- (id) initWithUserId:(NSString *) userId
			   writer:(NSString *) writer
				wtime:(NSString *) wtime
			 bcomment:(NSString *) bcomment
				 mseq:(int) mseq
				  seq:(int) seq;
@end
