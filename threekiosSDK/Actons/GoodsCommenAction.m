//
//  GoodsCommenAction.m
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "GoodsCommenAction.h"

@implementation GoodsCommenAction

- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (GoodsCommenAction *) action{
    return [[[GoodsCommenAction alloc]init]autorelease];
}

- (void)post:(NSNumber *) uid
 accessToken:(NSString *) accessToken
     goodsId:(NSString *) goodsId
    question:(NSString *) question{
    [super postWithAPIPath:@"comment/post"
                    params:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                            uid, @"uid",
                            accessToken,@"access_token",
                            goodsId, @"goods_id",
                            question, @"question",nil]];

}

- (void)reply:(NSNumber *) uid
  accessToken:(NSString *) accessToken
          cid:(NSString *) cid
       answer:(NSString *) answer{
    [super postWithAPIPath:@"comment/reply"
                    params:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                            uid, @"uid",
                            accessToken,@"access_token",
                            cid, @"c_id",
                            answer, @"answer",nil]];
}


- (void)getList:(NSMutableDictionary *)params{
    [super getWithAPIPath:@"comment/getList" params:params];
}

@end
