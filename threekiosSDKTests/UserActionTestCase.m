//
//  UserActionTestCase.m
//  threekiosSDK
//
//  Created by Justin on 13-1-29.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "UserActionTestCase.h"
#import "UserAction.h"

@implementation UserActionTestCase

- (void)setUp{
    [super setUp];
    // Set-up code here.
}

- (void)tearDown{
    // Tear-down code here.
    
    [super tearDown];
}

//用户名重复注册
- (void)testReg{
    UserAction *userAction = [UserAction action];
    userAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"10006", @"用户重复");
    };
    
    [userAction reg:@"justin6" password:@"123456"];
    
}

//敏感词注册
- (void)testReg1{
    
}

//手机号注册
- (void)testReg2{
    
}


- (void)testLogin{
    //STFail(@"U2222");
}


@end
