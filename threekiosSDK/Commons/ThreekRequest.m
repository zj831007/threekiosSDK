//
//  ThreekRequest.m
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "ThreekRequest.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"




@implementation ThreekRequest

- (void)dealloc{

    _delegate = nil;
    
    [_accessToken release];
    [super dealloc];
}


- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (id)initWithDelegate:(id<ThreekRequestDelegate>)delegate{
    self = [self init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (id)initWithAccessToken:(NSString *)accessToken delegate:(id<ThreekRequestDelegate>)delegate{
    self = [super init];
    if (self) {
        self.accessToken = accessToken;
        self.delegate = delegate;
    }
    return  self;
}

- (void)cancel{
    
}
- (void)getFromUrl:(NSString *)url params:(NSMutableDictionary *)params{
    [self processParams:params];
    
    NSString* urlString = [[self class] serializeURL:url params:params];
    
    
    ASIHTTPRequest *request  = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setValidatesSecureCertificate:NO];
    [request addRequestHeader:@"User-Agent" value:kUserAgent];
    
    [request startSynchronous];
    NSError *error = [request error];
    if (error) {
        if ([_delegate respondsToSelector:@selector(request:didFailWithError:)]) {
            [_delegate request:self didFailWithError:error];
        }
        
    }else{
        
        [self performSelectorInBackground:@selector(handleResponseData:) withObject:[request responseData]];
    }

}

- (void)postToUrl:(NSString *)url params:(NSMutableDictionary *)params{
    
    [self processParams:params];
    
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
    [request setValidatesSecureCertificate:NO];
    [request addRequestHeader:@"User-Agent" value:kUserAgent];
    
    for (NSString* key in [params keyEnumerator]) {
        id val = [params objectForKey:key];
        if ([val isKindOfClass:[NSData class]]) {
            NSString *contentType = [self contentTypeForImageData:val];
            if (contentType) {
                [request addData:val withFileName:[contentType stringByReplacingOccurrencesOfString:@"/" withString:@"threek."] andContentType:contentType forKey:key];
            }
            else {
                [request addData:val forKey:key];
            }
        }
        else if ([val isKindOfClass:[UIImage class]]) {
            NSData* imageData = UIImagePNGRepresentation((UIImage*)val);
            [request addData:imageData withFileName:@"threek.png" andContentType:@"image/png" forKey:key];
        }
        else {
            [request addPostValue:val forKey:key];
        }
    }
    
    [request startSynchronous];
    NSError *error = [request error];
    if (error) {
        if ([_delegate respondsToSelector:@selector(request:didFailWithError:)]) {
            [_delegate request:self didFailWithError:error];
        }
        
    }else{

        [self performSelectorInBackground:@selector(handleResponseData:) withObject:[request responseData]];
    }
    
}
- (void)getFromPath:(NSString *)apiPath params:(NSMutableDictionary *)params{
    NSString * fullURL = [kThreekAPIBaseUrl stringByAppendingString:apiPath];
    return [self getFromUrl:fullURL params:params];
    
}
- (void)postToPath:(NSString *)apiPath params:(NSMutableDictionary *)params{

    NSString * fullURL = [kThreekAPIBaseUrl stringByAppendingString:apiPath];

    [self postToUrl:fullURL params:params];
}




+ (NSString *)serializeURL:(NSString *)baseUrl params:(NSDictionary *)params{
    NSURL* parsedURL = [NSURL URLWithString:baseUrl];
    NSString* queryPrefix = parsedURL.query ? @"&" : @"?";
    
    NSMutableArray* pairs = [NSMutableArray array];
    for (NSString* key in [params keyEnumerator]) {
        if (([[params objectForKey:key] isKindOfClass:[UIImage class]])
            ||([[params objectForKey:key] isKindOfClass:[NSData class]])) {
            continue;
        }
        
        NSString* escaped_value = (NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                      NULL, /* allocator */
                                                                                      (CFStringRef)[params objectForKey:key],
                                                                                      NULL, /* charactersToLeaveUnescaped */
                                                                                      (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                      kCFStringEncodingUTF8);
        
        [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, escaped_value]];
        [escaped_value release];
    }
    NSString* query = [pairs componentsJoinedByString:@"&"];
    
    return [NSString stringWithFormat:@"%@%@%@", baseUrl, queryPrefix, query];
}





- (void)handleResponseData:(NSData *)data {
   
    //JSON解析
    NSError *parseError = nil;
    
    JSONDecoder *parser = [JSONDecoder decoder];
    id result = [parser mutableObjectWithData:data error:&parseError];
    
	if (parseError){
        NSLog(@"Parse Json error!%@", [[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding]autorelease]);
	}
    
    if ([_delegate respondsToSelector:@selector(request:didLoad:)]) {
        [_delegate request:self didLoad:result];
    }
   
}

- (void)processParams:(NSMutableDictionary *)params {
    if (!params) {
        params = [NSMutableDictionary dictionary];
    }
    if (self.accessToken) {
        [params setObject:self.accessToken forKey:@"access_token"];
    }
}

- (NSString *)contentTypeForImageData:(NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    
    switch (c) {
        case 0xFF:
            return @"image/jpeg";
        case 0x89:
            return @"image/png";
        case 0x47:
            return @"image/gif";
        case 0x49:
        case 0x4D:
            return @"image/tiff";
    }
    return nil;
}

@end
