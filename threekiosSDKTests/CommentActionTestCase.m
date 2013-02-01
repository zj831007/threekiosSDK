//
//  CommentActionTestCase.m
//  threekiosSDK
//
//  Created by Justin on 13-1-29.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "CommentActionTestCase.h"
#import "GoodsCommenAction.h"

@implementation CommentActionTestCase

- (void)setUp{
    [super setUp];
    // Set-up code here.
}

- (void)tearDown{
    // Tear-down code here.
    
    [super tearDown];
}

#pragma mark -
#pragma mark GetList test case

- (void)testGetList{
    GoodsCommenAction *commentAction = [GoodsCommenAction action];
    commentAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"30006", @"商品ID不存在");
    };
    
    [commentAction getList:[@{@"good_id":@"1"} mutableCopy]];
    
}


#pragma mark -
#pragma mark Reply test case

- (void)testReply{
    GoodsCommenAction *commentAction = [GoodsCommenAction action];
    commentAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"40000", @"商品ID不存在");
    };
    
    [commentAction reply:@1 accessToken:@"dd" cid:@"dd" answer:@"Test"];
    
}

#pragma mark -
#pragma mark Post test case

- (void)testPost{
    GoodsCommenAction *commentAction = [GoodsCommenAction action];
    commentAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"40000", @"商品ID不存在");
    };
    
    [commentAction post:@1 accessToken:@"ddd" goodsId:@"dd" question:@"test"];
    
}


@end
