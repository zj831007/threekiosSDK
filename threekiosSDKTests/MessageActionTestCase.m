//
//  MessageActionTestCase.m
//  threekiosSDK
//
//  Created by Justin on 13-1-29.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "MessageActionTestCase.h"
#import "MessageAction.h"
#import "Constants.h"

@implementation MessageActionTestCase

- (void)setUp{
    [super setUp];
    // Set-up code here.
}

- (void)tearDown{
    // Tear-down code here.
    
    [super tearDown];
}

#pragma mark -
#pragma mark Send test case

- (void)testSend{
    MessageAction *messageAction = [MessageAction action];
    messageAction.resultErrorBlock = ^(id result){
        
        STAssertEqualObjects([result objectForKey:@"error_code"], @"10012", @"发送方或接收方不存在");
    };
    
    [messageAction send:TEST_UID accessToken:TEST_TOKEN toUid:@0 content:@"Test"];
    
}

- (void)testSend1{
    MessageAction *messageAction = [MessageAction action];
    messageAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"50001", @"不能给自己发消息");
    };
    
    [messageAction send:TEST_UID accessToken:TEST_TOKEN toUid:TEST_UID content:@"Test"];
    
}


#pragma mark -
#pragma mark Del test case

- (void)testDel{
    MessageAction *messageAction = [MessageAction action];
    messageAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"10005", @"登陆信息已失效");
    };
    
    [messageAction del:TEST_UID accessToken:@"f" otherUid:TEST_OTHERUID];
    
}




@end
