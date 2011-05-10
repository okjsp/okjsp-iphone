//
//  XmlParser.m
//  iphone
//
//  Created by insford on 10. 8. 15..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "XmlParser.h"


@implementation XmlParser

//Member Parser
+ (Member *) parseMemberFromData:(NSData *) data {
	if (data != nil) {
		GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data
															   options:0 error:nil];
		Member *member = [XmlParser parseMemberFromXmlElement:doc.rootElement];
		
		[doc release];
		return member;
	}
	return nil;
}

+ (Article *) parseArticleFromData:(NSData *) data {
	if (data != nil) {
		GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data
															   options:0 error:nil];
		Article *article = [XmlParser parseArticleFromXmlElement:doc.rootElement];
		[doc release];
		return article;
	}
	return nil;
}

//데이터로부터 파싱하여, 게시물리스트를 리턴한다.
+ (NSArray *) parseArticleListFromData:(NSData *) data {
	if (data != nil) {
		GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data
															   options:0 error:nil];
		GDataXMLElement *element = doc.rootElement;
		
		NSArray *childs = [element elementsForName:@"article"];
		
		NSMutableArray *articleList = [[NSMutableArray alloc] init];
		
		for (int i = 0; i < [childs count]; i++) {
			element = [childs objectAtIndex:i];
			Article *article = [self parseArticleFromXmlElement:element];
			[articleList addObject:article];
		}
		
		
		[doc release];
		return [articleList autorelease];
	}
	return nil;
}

//메모리스트 파싱
+ (NSArray *) parseMemoListFromData:(NSData *) data {
	if (data != nil) {
		GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data
															   options:0 error:nil];
		GDataXMLElement *element = doc.rootElement;
		
		NSArray *childs = [element elementsForName:@"memo"];
		
		NSMutableArray *memoList = [[NSMutableArray alloc] init];
		
		for (int i = 0; i < [childs count]; i++) {
			element = [childs objectAtIndex:i];
			Memo *memo = [self parseMemoFromXmlElement:element];
			[memoList addObject:memo];
		}
		
		
		[doc release];
		return [memoList autorelease];
	}
	return nil;
}

//게시판리스트 파싱
+ (NSArray *) parseBBSInfoListFromData:(NSData *) data {
	if (data != nil) {
		GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data
															   options:0 error:nil];
		GDataXMLElement *element = doc.rootElement;
		
		NSArray *childs = [element elementsForName:@"bbsInfo"];
		
		NSMutableArray *bbsInfoList = [[NSMutableArray alloc] init];
		
		for (int i = 0; i < [childs count]; i++) {
			element = [childs objectAtIndex:i];
			BBSInfo *bbsInfo = [self parseBBSInfoFromXmlElement:element];
			[bbsInfoList addObject:bbsInfo];
		}
		
		[doc release];
		return [bbsInfoList autorelease];
	}
	return nil;
}



+ (NSString *) firstNodeValueForName:(NSString *) nodeName inElement:(GDataXMLElement *) element {
	NSArray *array = [element elementsForName:nodeName];
	if (array.count > 0) {
		GDataXMLElement *element = (GDataXMLElement *) [array objectAtIndex:0];
		return element.stringValue;
	}
	return nil;
}


// Article parser
+ (Article *) parseArticleFromXmlElement:(GDataXMLElement *) element {
	if (element != nil) {
		NSString *subject = [XmlParser firstNodeValueForName:@"subject" inElement:element];
		NSString *content = [XmlParser firstNodeValueForName:@"content" inElement:element];
		NSString *writer = [XmlParser firstNodeValueForName:@"writer" inElement:element];
		NSString *when = [XmlParser firstNodeValueForName:@"when" inElement:element];
		NSString *memo = [XmlParser firstNodeValueForName:@"memo" inElement:element];
		NSString *seq = [XmlParser firstNodeValueForName:@"seq" inElement:element];

		Article *article = [[Article alloc] initWithSubject:subject 
													content:content 
													 writer:writer 
													   when:when 
													   memo:memo.intValue 
														seq:seq.intValue];
		return [article autorelease];
	} 
	return nil;
}

// Member parser
+ (Member *) parseMemberFromXmlElement:(GDataXMLElement *) element {
	if (element != nil) {
		return [[[Member alloc] init] autorelease];
	} 
	return nil;
}

+ (BBSInfo *) parseBBSInfoFromXmlElement:(GDataXMLElement *) element {
	if (element != nil) {
		NSString *bbs = [XmlParser firstNodeValueForName:@"bbs" inElement:element];
		NSString *name = [XmlParser firstNodeValueForName:@"name" inElement:element];
		
		BBSInfo *bbsInfo = [[BBSInfo alloc] initWithBbs:bbs name:name];
		return [bbsInfo autorelease];
	}
	return nil;
}

+ (Memo *) parseMemoFromXmlElement:(GDataXMLElement *) element {
	if (element != nil) {
		NSString *userId = [XmlParser firstNodeValueForName:@"id" inElement:element];
		NSString *writer = [XmlParser firstNodeValueForName:@"writer" inElement:element];
		NSString *wtime = [XmlParser firstNodeValueForName:@"wtime" inElement:element];
		NSString *bcomment = [XmlParser firstNodeValueForName:@"bcomment" inElement:element];
		NSString *mseq = [XmlParser firstNodeValueForName:@"mseq" inElement:element];
		NSString *seq = [XmlParser firstNodeValueForName:@"seq" inElement:element];
		
		Memo *memo = [[Memo alloc] initWithUserId:userId writer:writer wtime:wtime bcomment:bcomment mseq:mseq.intValue seq:seq.intValue];
		return [memo autorelease];
	}
	return nil;
}


+ (NSString *) parseLoginFromData:(NSData *) data{
	if (data != nil) {
		GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data
															   options:0 error:nil];
		GDataXMLElement *element = doc.rootElement;
		
		NSString *result = [XmlParser firstNodeValueForName:@"result" inElement:element];
		
		[doc release];
		return result;
	}
}

@end
