//
//  ImgActionTestCase.m
//  threekiosSDK
//
//  Created by Justin on 13-1-29.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "ImgActionTestCase.h"
#import "ImageAction.h"

@implementation ImgActionTestCase

- (void)setUp{
    [super setUp];
    // Set-up code here.
}

- (void)tearDown{
    // Tear-down code here.
    
    [super tearDown];
}

//图片上传
- (void)testUpload{
    ImageAction *imageAction = [ImageAction action];
    imageAction.resultErrorBlock = ^(id result){
        STAssertEqualObjects([result objectForKey:@"error_code"], @"20003", @"图片不能为空");
    };
    
    [imageAction upload:@1 accessToken:@"s" ext:@"3" type:@1 img:nil];
    
}



@end
