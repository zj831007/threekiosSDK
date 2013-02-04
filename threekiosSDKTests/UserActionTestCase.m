//
//  UserActionTestCase.m
//  threekiosSDK
//
//  Created by Justin on 13-1-29.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "UserActionTestCase.h"
#import "UserAction.h"
#import "Constants.h"

@implementation UserActionTestCase

- (void)setUp{
    [super setUp];
    // Set-up code here.
}

- (void)tearDown{
    // Tear-down code here.
    
    [super tearDown];
}

#pragma mark -
#pragma mark Reg test case

//用户名重复注册
- (void)testReg{
    UserAction *userAction = [UserAction action];
    userAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"10006", @"用户名重复判断失败");
    };
    
    [userAction reg:@"justin00" password:@"123456"];
    
}

//敏感词注册
- (void)testReg1{
    UserAction *userAction = [UserAction action];
    userAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"99998", @"用户名包含敏感词");
    };
    [userAction reg:@"法轮功" password:@"123456"];
}

//手机号注册
- (void)testReg2{
    UserAction *userAction = [UserAction action];
    userAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"10008", @"用户名不能为手机号");
    };
    [userAction reg:@"13716981343" password:@"123456"];
}

#pragma mark -
#pragma mark Login test case

//登陆
- (void)testLogin{
    UserAction *userAction = [UserAction action];
    userAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"10001", @"用户名或密码不正确");
    };
    [userAction login:@"111111" password:@"11111111"];
}


- (void)testLogin1{
    UserAction *userAction = [UserAction action];
    userAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"88888", @"用户名或密码不正确");
    };
    //[userAction login:@"justin00" password:@"123456"];
}


#pragma mark -
#pragma mark Logout test case
- (void)testLogout{
    UserAction *userAction = [UserAction action];
    userAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"10012", @"用户ID不存在");
    };
    [userAction logout:@-1 accessToken:TEST_TOKEN];
}

- (void)testLogout1{
    UserAction *userAction = [UserAction action];
    userAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"10005", @"用户登陆信息已失效");
    };
    //[userAction logout:TEST_UID accessToken:TEST_TOKEN];
}

#pragma mark -
#pragma mark Status test case


#pragma mark -
#pragma mark Profile test case
- (void)testProfile{
    UserAction *userAction = [UserAction action];
    userAction.resultErrorBlock = ^(id result){ 
        STAssertEqualObjects([result objectForKey:@"error_code"], @"10012", @"用户ID不存在");
    };
    [userAction getProfile:@-1];
}

#pragma mark -
#pragma mark Profile test case
- (void)testEditProfile{
    
    UserAction *userAction = [UserAction action];
    userAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"99998", @"昵称不能包含敏感词");
    };
    [userAction editProfile:[@{@"uid":TEST_UID,@"access_token":TEST_TOKEN,@"nickname":@"法轮功"} mutableCopy]];
}

- (void)testEditProfile1{
    
    UserAction *userAction = [UserAction action];
    userAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"88888", @"修改昵称失败");
    };
    [userAction editProfile:[@{@"uid":TEST_UID,@"access_token":TEST_TOKEN,@"nickname":@"Justin_test_1"} mutableCopy]];
}

@end
