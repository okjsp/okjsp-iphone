//
//  Member.h
//  iphone
//
//  Created by insford on 10. 8. 22..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Member : NSObject {
	NSString *_userId;
	NSString *_name;
	NSString *_password;
	NSString *_email;
	NSString *_homepage;
	NSDate *_joindate;
	NSString *_profile;
	NSString *_mailing;
	long _point;
	long _sid;
	NSArray *_role;
	NSString *_file;
}
@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *homepage;
@property (nonatomic, retain) NSDate *joindate;
@property (nonatomic, retain) NSString *profile;
@property (nonatomic, retain) NSString *mailing;
@property (nonatomic, assign) long point;
@property (nonatomic, assign) long sid;
@property (nonatomic, retain) NSArray *role;
@property (nonatomic, retain) NSString *file;


@end
