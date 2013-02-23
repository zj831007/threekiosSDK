//
//  GoodsAction.h
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThreekConfig.h"
#import "CommonAction.h"
#import "ThreekRequest.h"


@interface GoodsAction : CommonAction


+ (GoodsAction *) action;

- (void)publish:(NSMutableDictionary *)goodsInfo;

- (void)detail:(NSString *) goodsId;

- (void)offline:(NSNumber *) uid accessToken:(NSString *)accessToken goodsId:(NSString *)goodsId;

- (void)getList:(NSMutableDictionary *)params;

- (void)getNearbyList:(NSMutableDictionary *)params;

- (void)getPublishList:(NSMutableDictionary *)params;

@end
