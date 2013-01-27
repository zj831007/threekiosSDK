//
//  PathHelper.h
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PathHelper : NSObject {
    
}

+ (BOOL)createPathIfNecessary:(NSString*)path;

+ (NSString*)bundlePathWithName:(NSString *)name;
+ (NSString*)documentDirectoryPathWithName:(NSString*)name;

+ (NSString*)cacheDirectoryPathWithName:(NSString*)name;
+ (NSString*)cacheDirectoryPathWithName:(NSString*)name createPathIfNecessary:(BOOL)createPathIfNecessary;

+ (NSString *)sanitizeFileNameString:(NSString *)fileName;

@end
