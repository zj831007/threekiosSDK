//
//  MessageAction.h
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThreekConfig.h"
#import "CommonAction.h"
#import "ThreekRequest.h"


@interface MessageAction : CommonAction

+ (MessageAction *) action;

- (void)send:(NSNumber *) uid
 accessToken:(NSString *) accessToken
       toUid:(NSNumber *) toUid
     content:(NSString *) content;

- (void)getList:(NSMutableDictionary *)params;

- (void)getDetailList:(NSMutableDictionary *)params;

- (void)del:(NSNumber *) uid
 accessToken:(NSString *) accessToken
   otherUid:(NSNumber *) otherUid;

- (void)unread:(NSNumber *) uid
   accessToken:(NSString *) accessToken;

@end
