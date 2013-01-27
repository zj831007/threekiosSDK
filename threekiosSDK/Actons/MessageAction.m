//
//  MessageAction.m
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "MessageAction.h"

@implementation MessageAction

- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (MessageAction *) action{
    return [[[MessageAction alloc]init]autorelease];
}

- (void)send:(NSNumber *) uid
 accessToken:(NSString *) accessToken
       toUid:(NSNumber *) toUid
     content:(NSString *) content{
    
    [super postWithAPIPath:@"message/send"
                    params:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                            uid, @"uid",
                            accessToken,@"access_token",
                            uid, @"from_uid",
                            toUid, @"to_uid",
                            content, @"content", nil]];

}

- (void)getList:(NSMutableDictionary *)params{
    [super getWithAPIPath:@"message/getList" params:params];

}

- (void)getDetailList:(NSMutableDictionary *)params{
    [super getWithAPIPath:@"message/getDetailList" params:params];

}

- (void)del:(NSNumber *) uid
accessToken:(NSString *) accessToken
   otherUid:(NSNumber *) otherUid{
    [super postWithAPIPath:@"message/del"
                    params:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                            uid, @"uid",
                            accessToken,@"access_token",
                            otherUid, @"other_uid", nil]];
}

- (void)unread:(NSNumber *) uid
   accessToken:(NSString *) accessToken{
    [super getWithAPIPath:@"message/unread"
                    params:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                            [uid stringValue], @"uid",
                            accessToken,@"access_token",nil]];
}

@end
