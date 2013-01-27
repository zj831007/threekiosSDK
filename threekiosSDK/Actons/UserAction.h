//
//  UserAction.h
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ThreekConfig.h"
#import "CommonAction.h"
#import "ThreekRequest.h"
#import "UserInfo.h"



@interface UserAction : CommonAction

+ (UserAction *) action;

- (void)reg:(NSString *) username password:(NSString *) password;

- (void)login:(NSString *) username password:(NSString *) password;

- (void)logout:(NSNumber *) uid accessToken:(NSString *) accessToken;

- (void)getProfile:(NSNumber *) uid;

- (void)editProfile:(NSMutableDictionary *) userInfo;

- (void)status:(NSNumber *) uid accessToken:(NSString *) accessToken op:(NSNumber *) op;


@end
