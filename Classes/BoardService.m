//
//  BoardService.m
//  iphone
//
//  Created by insford on 10. 8. 15..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "BoardService.h"


@implementation BoardService

static NSString *OK_JSP_HOST = @"http://www.okjsp.pe.kr";

static NSString *SELECT_BOARD_LIST = @"%@/html5/rest/bbs/list";
static NSString *SELECT_ARTICLE = @"%@/html5/rest/article/%d";
static NSString *SELECT_ARTICLE_LIST = @"%@/html5/rest/article/list/%@";
static NSString *SELECT_MEMO_LIST = @"%@/html5/rest/memo/list/%d";

//게시물 조회
+ (Article *) selectArticleOfSeq:(int) seq {
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:SELECT_ARTICLE, OK_JSP_HOST, seq]];
	NSData *data = [HttpRequester requestGET:url];
	Article *article = [XmlParser parseArticleFromData:data];
	return article;
}
//게시물 입력
+ (BOOL) insertArticle:(Article *) article {
	return NO;
}
//게시물 수정
+ (BOOL) updateArticle:(Article *) article {
	return NO;
}
//게시물 삭제
+ (BOOL) deleteArticleOfSeq:(int) seq {
	return NO;
}

//게시물 리스트 조회
+ (NSArray *) selectArticleListOfBbs:(NSString *) bbs
							startRow:(int) startRow 
							  endRow:(int) endRow {
	
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:SELECT_ARTICLE_LIST, OK_JSP_HOST, bbs]];
	NSData *data = [HttpRequester requestGET:url];
	NSArray *articleList = [XmlParser parseArticleListFromData:data];
	return articleList;
}

//댓글리스트 조회
+ (NSArray *) selectMemoListOfSeq:(int) articleSeq {
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:SELECT_MEMO_LIST, OK_JSP_HOST, articleSeq]];
	NSData *data = [HttpRequester requestGET:url];
	NSArray *memoList = [XmlParser parseMemoListFromData:data];
	return memoList;
}
//게시판 리스트 조회
+ (NSArray *) selectBBSInfoList {
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:SELECT_BOARD_LIST, OK_JSP_HOST]];
	NSData *data = [HttpRequester requestGET:url];
	NSArray *bbsInfoList = [XmlParser parseBBSInfoListFromData:data];
	return bbsInfoList;
}


@end
