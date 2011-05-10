//
//  Memo.m
//  iphone
//
//  Created by insford on 10. 8. 29..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "Memo.h"


@implementation Memo

@synthesize userId = _userId;
@synthesize writer = _writer;
@synthesize wtime = _wtime;
@synthesize bcomment = _bcomment;
@synthesize mseq = _mseq;
@synthesize seq = _seq;

- (id) initWithUserId:(NSString *) userId
			   writer:(NSString *) writer
				wtime:(NSString *) wtime
			 bcomment:(NSString *) bcomment
				 mseq:(int) mseq
				  seq:(int) seq {
	
	if (self = [super init]) {
		self.userId = userId;
		self.writer = writer;
		self.wtime = wtime;
		self.bcomment = bcomment;
		self.mseq = mseq;
		self.seq = seq;
	}
	return self;
}

- (NSString *) description {
	return [NSString stringWithFormat:@"\n userId=%@,\n bcomment=%@,\n writer=%@,\n wtime=%@", _userId, _bcomment, _writer, _wtime];
}

- (void) dealloc {
	[_userId release];
	[_writer release];
	[_wtime release];
	[_bcomment release];
	[super dealloc];
}

@end
