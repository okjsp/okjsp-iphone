//
//  MemberService.h
//  iphone
//
//  Created by insford on 10. 8. 22..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XmlParser.h"
#import "HttpRequester.h"


@interface MemberService : NSObject {
	UITextField *userId;
	UITextField *password;
}
//로그인 처리
+ (Member *) loginWithUserId:(NSString *) id 
					password:(NSString *) password 
				isSaveUserId:(BOOL) isSaveUserId
				 isAutoLogin:(BOOL) isAutoLogin;

//로그인중인지 여부

//로그인 Alert UI 띄우기
+ (void) loginPopup;


@end
