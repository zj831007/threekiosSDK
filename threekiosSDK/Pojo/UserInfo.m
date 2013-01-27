//
//  UserInfo.m
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

- (void)dealloc{
    
    [_uid release];
    [_gender release];
    [_accessToken release];
    [_nickName release];
    [_desc release];
    [_pushToken release];
    [super dealloc];
}

@end
