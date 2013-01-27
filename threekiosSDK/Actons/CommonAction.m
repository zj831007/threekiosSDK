//
//  CommonAction.m
//  threekiosSDK
//
//  Created by Justin on 13-1-27.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "CommonAction.h"

@implementation CommonAction

- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)initRequest{
    if (_request) {
        [self cancel];
    }
    _request = [[ThreekRequest alloc] initWithDelegate:self];
}

- (void)dealloc{
    [_resultDataBlock release];
    [_resultErrorBlock release];
    
    [_request cancel];
    [_request release];
    _request = nil;
    
    [super dealloc];
}

- (void)clearRequest{
    [_request release];
    _request = nil;
}

- (void)cancel{
    [_request cancel];
    [self clearRequest];
}

- (void)getWithAPIPath:(NSString *)apiPath
                params:(NSMutableDictionary *)params{
    [self initRequest];
    [_request getFromPath:apiPath params:params];
}

- (void)postWithAPIPath:(NSString *)apiPath
                 params:(NSMutableDictionary *) params{
    [self initRequest];
    [_request postToPath:apiPath params:params];
}

- (void)request:(ThreekRequest *)request didFailWithError:(NSError *)error {
    
    [self clearRequest];
}

- (void)request:(ThreekRequest *)request didLoad:(id)result{
    if ([result isKindOfClass:[NSDictionary class]]){
       
        if ([result objectForKey:@"error_code"] != nil){
            
            if(_resultErrorBlock != nil){
                _resultErrorBlock(result);
            }
            
        }else{
            if(_resultDataBlock != nil){
                _resultDataBlock(result);
            }
        }
    }
}

@end
