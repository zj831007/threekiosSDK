//
//  GoodsActionTestCase.m
//  threekiosSDK
//
//  Created by Justin on 13-1-29.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "GoodsActionTestCase.h"
#import "GoodsAction.h"

@implementation GoodsActionTestCase



- (void)setUp{
    [super setUp];
    // Set-up code here.
}

- (void)tearDown{
    // Tear-down code here.
    
    [super tearDown];
}

#pragma mark -
#pragma mark Publish test case

- (void)testPublish{
    GoodsAction *goodsAction = [GoodsAction action];
    goodsAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"30000", @"发布商品失败");
    };
    
    [goodsAction publish:[@{@"uid":@1,@"title":@"test"} mutableCopy]];
                          
    
}

- (void)testPublish1{
    GoodsAction *goodsAction = [GoodsAction action];
    goodsAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"30006", @"商品ID不存在");
    };
    
    [goodsAction publish:[@{@"uid":@1,@"title":@"test",@"goods_id":@"11"} mutableCopy]];
    
    
}


#pragma mark -
#pragma mark Detail test case
- (void)testDetail{
    GoodsAction *goodsAction = [GoodsAction action];
    goodsAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"30006", @"商品ID不存在");
    };
    
    [goodsAction detail:@"sss"];
    
}

#pragma mark -
#pragma mark Offline test case
- (void)testOffline{
    GoodsAction *goodsAction = [GoodsAction action];
    goodsAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"10006", @"登陆失效");
    };
    
    [goodsAction offline:@1 accessToken:@"33" goodsId:@"dd"];
    
}

@end
