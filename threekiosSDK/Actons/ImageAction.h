//
//  ImageAction.h
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThreekConfig.h"
#import "CommonAction.h"
#import "ThreekRequest.h"


@interface ImageAction : CommonAction

+ (ImageAction *) action;

- (void)upload:(NSNumber *) uid
   accessToken:(NSString *) accessToken
           ext:(NSString *) ext
          type:(NSNumber *) type
           img:(UIImage *) img;

@end
