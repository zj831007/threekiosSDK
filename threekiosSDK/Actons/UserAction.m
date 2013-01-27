//
//  UserAction.m
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "UserAction.h"


@implementation UserAction

- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (UserAction *) action{
    return [[[UserAction alloc]init]autorelease];
}

- (void)reg:(NSString *) username password:(NSString *) password{
    [super postWithAPIPath:@"user/reg"
                    params:[NSMutableDictionary dictionaryWithObjectsAndKeys:username, @"account", password, @"password",nil]];
}

- (void)login:(NSString *) username password:(NSString *) password{
    [super postWithAPIPath:@"user/login"
                    params:[NSMutableDictionary dictionaryWithObjectsAndKeys:username, @"account", password, @"password",nil]];
}

- (void)logout:(NSNumber *) uid accessToken:(NSString *) accessToken{
    [super postWithAPIPath:@"user/logout"
                    params:[NSMutableDictionary dictionaryWithObjectsAndKeys:uid, @"uid", accessToken, @"access_token",nil]];

}

- (void)getProfile:(NSNumber *) uid{
    [super getWithAPIPath:@"user/profile"
                    params:[NSMutableDictionary dictionaryWithObjectsAndKeys:[uid stringValue], @"uid",nil]];

}

- (void)editProfile:(NSMutableDictionary *) userInfo{
    [super postWithAPIPath:@"user/editProfile" params:userInfo];
    
}

- (void)status:(NSNumber *) uid accessToken:(NSString *) accessToken op:(NSNumber *) op{
    [super postWithAPIPath:@"user/status"
                    params:[NSMutableDictionary dictionaryWithObjectsAndKeys:uid, @"uid", accessToken, @"access_token", op, @"op", nil]];

}


@end
