//
//  HttpRequester.m
//  iphone
//
//  Created by insford on 10. 8. 14..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "HttpRequester.h"


@implementation HttpRequester

+ (NSData *) requestGET:(NSURL *) url {
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy 
													   timeoutInterval:5.0];
	// GET 방식
	[request setHTTPMethod:@"GET"];
	NSHTTPURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
	return data;
}

//POST
+ (NSData *) requestPOST:(NSURL *) url loginId:(NSString *) id loginPw:(NSString *) password{
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy 
													   timeoutInterval:5.0];
	[request setHTTPMethod:@"POST"];
	[request setHTTPBody:[[NSString stringWithFormat:@"id=%@&password=%@", id , password] dataUsingEncoding:NSASCIIStringEncoding]];
	NSHTTPURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
	return data;
}
@end
