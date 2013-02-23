//
//  GoodsAction.m
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "GoodsAction.h"

@implementation GoodsAction

- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (GoodsAction *) action{
    return [[[GoodsAction alloc]init]autorelease];
}

- (void)publish:(NSMutableDictionary *)goodsInfo{
    [super postWithAPIPath:@"goods/publish" params:goodsInfo];
}

- (void)detail:(NSString *) goodsId{
    [super getWithAPIPath:@"goods/detail"
                   params:[NSMutableDictionary dictionaryWithObjectsAndKeys:goodsId, @"goods_id",nil]];
    

}

- (void)offline:(NSNumber *) uid accessToken:(NSString *)accessToken goodsId:(NSString *)goodsId{
    [super postWithAPIPath:@"goods/offline"
                    params:[NSMutableDictionary dictionaryWithObjectsAndKeys:uid, @"uid", accessToken,
                            @"access_token",goodsId, @"goods_id", nil]];
}

- (void)getList:(NSMutableDictionary *)params{
    [super getWithAPIPath:@"goods/getList" params:params];
}

- (void)getNearbyList:(NSMutableDictionary *)params{
    [super getWithAPIPath:@"goods/getNearbyList" params:params];
}

- (void)getPublishList:(NSMutableDictionary *)params{
    [super getWithAPIPath:@"goods/getPublishList" params:params];
}

@end
