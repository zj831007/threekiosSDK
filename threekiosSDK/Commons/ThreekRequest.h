//
//  ThreekRequest.h
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThreekConfig.h"
#import "JSONKit.h"

@class ThreekRequest;
@class ASIHTTPRequest;


@protocol ThreekRequestDelegate <NSObject>

@optional
- (void)request:(ThreekRequest *)request didFailWithError:(NSError *)error;
- (void)request:(ThreekRequest *)request didLoad:(id)result;

@end


@interface ThreekRequest : NSObject{
    
     id<ThreekRequestDelegate> _delegate;
    NSString                 *_accessToken;
}

@property(nonatomic, assign) id<ThreekRequestDelegate> delegate;
@property (nonatomic, copy) NSString *accessToken;


- (id)initWithDelegate:(id<ThreekRequestDelegate>)delegate;
- (id)initWithAccessToken:(NSString *)accessToken delegate:(id<ThreekRequestDelegate>)delegate;

- (void)cancel;
- (void)getFromUrl:(NSString *)url params:(NSMutableDictionary *)params;
- (void)postToUrl:(NSString *)url params:(NSMutableDictionary *)params;
- (void)getFromPath:(NSString *)apiPath params:(NSMutableDictionary *)params;
- (void)postToPath:(NSString *)apiPath params:(NSMutableDictionary *)params;

@end
