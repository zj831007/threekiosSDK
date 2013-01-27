//
//  ImageAction.m
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "ImageAction.h"

@implementation ImageAction

- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (ImageAction *) action{
    return [[[ImageAction alloc]init]autorelease];
}


- (void)upload:(NSNumber *) uid
   accessToken:(NSString *) accessToken
           ext:(NSString *) ext
          type:(NSNumber *) type
           img:(UIImage *) img{
    [super postWithAPIPath:@"img/upload"
                    params:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                            uid, @"uid",
                            accessToken,@"access_token",
                            ext, @"ext",
                            type, @"type",
                            img, @"img", nil]];

}

@end
