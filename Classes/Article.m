//
//  Article.m
//  iphone
//
//  Created by 인철 백 on 10. 8. 8..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "Article.h"


@implementation Article

@synthesize seq = _seq;	
@synthesize ref = _ref;
@synthesize step = _step;
@synthesize lev = _lev;
@synthesize read = _read;
@synthesize memo = _memo;
@synthesize bbs = _bbs;
@synthesize userId = _userId;
@synthesize sid = _sid;
@synthesize subject = _subject;
@synthesize content = _content;
@synthesize writer = _writer;
@synthesize password = _password;
@synthesize email = _email;
@synthesize homepage = _homepage;
@synthesize html = _html;
@synthesize ip = _ip;
@synthesize when = _when;
@synthesize ccl_id = _ccl_id;

- (id) initWithSubject:(NSString *) subject
			   content:(NSString *) content
				writer:(NSString *) writer
				  when:(NSString *) when 
				  memo:(int) memo
				   seq:(int) seq {
	
	if ((self = [super init])) {
		self.subject = subject;
		self.content = content;
		self.writer = writer;
		self.when = when;
		self.memo = memo;
		self.seq = seq;
	}	
	return self;
}

- (NSString *) description {
	NSString *desc = [NSString stringWithFormat:@"seq :%d\nuserId :%@\nsubject :%@\ncontent :%@\nwriter :%@\nmemo :%d",
					  _seq, _userId, _subject, _content, _writer, _memo];
	return desc;
}

- (void) dealloc {
	[super dealloc];
	[_bbs release];
	[_userId release];
	[_subject release];
	[_content release];
	[_writer release];
	[_password release];
	[_email release];
	[_homepage release];
	[_html release];
	[_ip release];
	[_when release];
	[_ccl_id release];
}
@end
