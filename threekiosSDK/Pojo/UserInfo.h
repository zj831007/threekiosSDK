//
//  UserInfo.h
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject


@property(nonatomic, retain)NSNumber *uid;
@property(nonatomic, retain)NSNumber *gender;
@property(nonatomic, copy)NSString *accessToken;
@property(nonatomic, copy)NSString *nickName;
@property(nonatomic, copy)NSString *desc;
@property(nonatomic, copy)NSString *pushToken;


@end
