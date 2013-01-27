//
//  GoodsCommenAction.h
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThreekConfig.h"
#import "CommonAction.h"
#import "ThreekRequest.h"


@interface GoodsCommenAction : CommonAction

+ (GoodsCommenAction *) action;

- (void)post:(NSNumber *) uid
 accessToken:(NSString *) accessToken
     goodsId:(NSString *) goodsId
    question:(NSString *) question;

- (void)reply:(NSNumber *) uid
  accessToken:(NSString *) accessToken
          cid:(NSString *) cid
       answer:(NSString *) answer;


- (void)getList:(NSMutableDictionary *)params;

@end
