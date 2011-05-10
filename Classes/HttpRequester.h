//
//  HttpRequester.h
//  iphone
//
//  Created by insford on 10. 8. 14..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequester : NSObject {
}

+ (NSData *) requestGET:(NSURL *) url;

+ (NSData *) requestPOST:(NSURL *) url loginId:(NSString *) id loginPw:(NSString *) password;
@end