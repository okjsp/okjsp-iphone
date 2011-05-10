//
//  Member.m
//  iphone
//
//  Created by insford on 10. 8. 22..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "Member.h"


@implementation Member

@synthesize userId = _userId;
@synthesize name = _name;
@synthesize password = _password;
@synthesize email = _email;
@synthesize homepage = _homepage;
@synthesize joindate = _joindate;
@synthesize profile = _profile;
@synthesize mailing = _mailing;
@synthesize point = point;
@synthesize sid = sid;
@synthesize role = _role;
@synthesize file = _file;

- (NSString*) description {
	return [NSString stringWithFormat:@"userId : %@\n, password: %@", _userId, _password];
}

- (void) dealloc {
	[_userId release];
	[_name release];
	[_password release];
	[_email release];
	[_homepage release];
	[_joindate release];
	[_profile release];
	[_mailing release];
	[_role release];
	[_file release];
	[super dealloc];
}
@end
