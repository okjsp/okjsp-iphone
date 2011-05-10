//
//  Article.h
//  iphone
//
//  Created by 인철 백 on 10. 8. 8..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 private int seq;
 private int ref;
 private int step;
 private int lev;
 private int read;
 private int memo;
 private String bbs;
 private String id;
 private long sid;
 private String writer;
 private String subject;
 private String content;
 private String password;
 private String email;
 private String homepage;
 private String html;
 private String ip;
 private Timestamp when;
 private String ccl_id;
*/
@interface Article : NSObject {
	int _seq;	
	int _ref;
	int _step;
	int _lev;
	int _read;
	int _memo;
	NSString *_bbs;
	NSString *_userId;
	long _sid;
	NSString *_subject;
	NSString *_content;
	NSString *_writer;
	NSString *_password;
	NSString *_email;
	NSString *_homepage;
	NSString *_html;
	NSString *_ip;
	NSString *_when;
	NSString *_ccl_id;
}
@property (nonatomic, assign) int seq;
@property (nonatomic, assign) int ref;
@property (nonatomic, assign) int step;
@property (nonatomic, assign) int lev;
@property (nonatomic, assign) int read;
@property (nonatomic, assign) int memo;
@property (nonatomic, retain) NSString *bbs;
@property (nonatomic, retain) NSString *userId;
@property (nonatomic, assign) long sid;
@property (nonatomic, retain) NSString *subject;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *writer;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *homepage;
@property (nonatomic, retain) NSString *html;
@property (nonatomic, retain) NSString *ip;
@property (nonatomic, retain) NSString *when;
@property (nonatomic, retain) NSString *ccl_id;

- (id) initWithSubject:(NSString *) subject
			 content:(NSString *) content
			  writer:(NSString *) writer
				  when:(NSString *) when 
				  memo:(int) memo
				 seq:(int) seq;

@end
