//
//  XmlParser.h
//  iphone
//
//  Created by insford on 10. 8. 15..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"
#import "Article.h"
#import "Member.h"
#import "BBSInfo.h"
#import "Memo.h"

@interface XmlParser : NSObject {

}
//Member Parser
+ (Member *) parseMemberFromData:(NSData *) data;
//Article Parser
+ (Article *) parseArticleFromData:(NSData *) data;
//Article List Parser
+ (NSArray *) parseArticleListFromData:(NSData *) data;
//메모리스트 파싱
+ (NSArray *) parseMemoListFromData:(NSData *) data;
//게시판리스트 파싱
+ (NSArray *) parseBBSInfoListFromData:(NSData *) data;

+ (NSString *) firstNodeValueForName:(NSString *) nodeName inElement:(GDataXMLElement *) element;

+ (Article *) parseArticleFromXmlElement:(GDataXMLElement *) element;
+ (Member *) parseMemberFromXmlElement:(GDataXMLElement *) element;
+ (BBSInfo *) parseBBSInfoFromXmlElement:(GDataXMLElement *) element;
+ (Memo *) parseMemoFromXmlElement:(GDataXMLElement *) element;

//로그인 성공여부
+ (NSString *) parseLoginFromData:(NSData *) data;

@end
