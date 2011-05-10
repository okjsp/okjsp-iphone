//
//  MemberService.m
//  iphone
//
//  Created by insford on 10. 8. 22..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "MemberService.h"

static NSString *OK_JSP_HOST = @"http://www.okjsp.pe.kr:9080";
static NSString *LOGIN = @"%@/html5/rest/login";

@implementation MemberService
+ (Member *) loginWithUserId:(NSString *) id 
					password:(NSString *) password 
				isSaveUserId:(BOOL) isSaveUserId
				 isAutoLogin:(BOOL) isAutoLogin {
	
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:LOGIN, OK_JSP_HOST]];
	NSLog(@"%@", url);
	NSData *login = [HttpRequester requestPOST:url loginId:id loginPw:password];
	NSString *isLogin = [XmlParser parseLoginFromData:login];
	
	NSLog(@"isLogin=====> %@", isLogin);
					 
	return nil;
	
}
+ (void) loginPopup {
	
	UIAlertView *prompt = [[UIAlertView alloc] initWithTitle:@"Username and password" 
													 message:@"\n\n\n" // 중요!! 칸을 내려주는 역할을 합니다.
													delegate:self 
										   cancelButtonTitle:@"Cancel"
										   otherButtonTitles:@"Enter", nil];
	
	userId = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 50.0, 260.0, 25.0)]; 
	[userId setBackgroundColor:[UIColor whiteColor]];
	[userId setPlaceholder:@"username"];
	[prompt addSubview:userId]; 
	password = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 85.0, 260.0, 25.0)]; 
	[password setBackgroundColor:[UIColor whiteColor]];
	[password setPlaceholder:@"password"];
	[password setSecureTextEntry:YES];
	[prompt addSubview:password];
	// AlertView의 위치를 이동 시켜 줌.
	[prompt setTransform:CGAffineTransformMakeTranslation(0.0, 110.0)];
	[prompt show];
	[prompt release];
	
	// textfield에 커서를 보내고 키보드를 표시 해 줌.
	[userId becomeFirstResponder];
	
}
@end
