//
//  BoardService.h
//  iphone
//
//  Created by insford on 10. 8. 15..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XmlParser.h"
#import "HttpRequester.h"

@interface BoardService : NSObject {

}

//게시물 조회
+ (Article *) selectArticleOfSeq:(int) seq;
//게시물 입력
+ (BOOL) insertArticle:(Article *) article;
//게시물 수정
+ (BOOL) updateArticle:(Article *) article;
//게시물 삭제
+ (BOOL) deleteArticleOfSeq:(int) seq;

//게시물 리스트 조회
+ (NSArray *) selectArticleListOfBbs:(NSString *) bbs
					   startRow:(int) startRow 
						  endRow:(int) endRow;

//댓글리스트 조회
+ (NSArray *) selectMemoListOfSeq:(int) articleSeq;

//게시판 리스트 조회
+ (NSArray *) selectBBSInfoList;

@end
