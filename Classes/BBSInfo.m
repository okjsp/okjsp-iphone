//
//  BBSInfo.m
//  iphone
//
//  Created by insford on 10. 8. 22..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "BBSInfo.h"


@implementation BBSInfo

@synthesize bbs = _bbs;
@synthesize name= _name;
@synthesize header = _header;
@synthesize cseq = _cseq;
@synthesize searchCount = _searchCount;
@synthesize bookmark = _bookmark;
@synthesize ord = _ord;

- (id) initWithBbs:(NSString *) bbs 
			  name:(NSString *) name {
	if ((self = [super init])) {
		self.bbs = bbs;
		self.name = name;
	}
	return self;
}

- (id) initWithBbsBookmark:(NSDictionary *)dict {
	if ((self = [super init])) {
		self.bbs = [dict objectForKey:@"bbs"];
		self.name = [dict objectForKey:@"name"];
		self.bookmark = [[dict objectForKey:@"bookmark"] integerValue];
		self.ord = [[dict objectForKey:@"ord"] integerValue];
	}
	return self;
}

- (NSString *) description {
	return [NSString stringWithFormat:@"bbs=%@, name=%@, bookmark=%d, ord=%d", _bbs, _name, _bookmark, _ord];
}

- (void) dealloc {
	[_bbs release];	
	[_name release];
	[_header release];
	[_cseq release];
	[super dealloc];
}

@end
