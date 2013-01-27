//
//  CommonAction.h
//  threekiosSDK
//
//  Created by Justin on 13-1-27.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThreekRequest.h"

@interface CommonAction : NSObject<ThreekRequestDelegate>{
    ThreekRequest *_request;
    
    //void (^_resultDataBlock)(id data);
    //void (^_resultErrorBlock)(ErrorCodeModel *);
}

@property (copy) void (^resultDataBlock)(id data);
@property (copy) void (^resultErrorBlock)(id data);

- (void)cancel;

- (void)getWithAPIPath:(NSString *)apiPath
                params:(NSMutableDictionary *)params;
- (void)postWithAPIPath:(NSString *)apiPath
                 params:(NSMutableDictionary *) params;

- (void)request:(ThreekRequest *)request didFailWithError:(NSError *)error;
- (void)request:(ThreekRequest *)request didLoad:(id)result;

@end
