//
//  AppDelegate.m
//  threekiosSDK
//
//  Created by Justin on 13-1-26.
//  Copyright (c) 2013年 3q. All rights reserved.
//

#import "AppDelegate.h"
#import "UserAction.h"
#import "GoodsAction.h"


@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    //reg
    UserAction *userAction = [UserAction action];
    userAction.resultErrorBlock = ^(id result){
        NSLog(@"%@---", result);
    };
    userAction.resultDataBlock = ^(id result){
        NSLog(@"%@----2", result);
    };
    
    //===================================================
    //=====================user==========================
    //===================================================
    
    //注册
    //[userAction reg:@"justin3" password:@"123456"];
    
    //登陆
    //[userAction login:@"justin3" password:@"123456"];
    
    //退出登陆
    //[userAction logout:@16 accessToken:@"607025c85a4e3ba2aa8d3969adb7438f"];
    
    //上线，离线
    //[userAction status:@15 accessToken:@"6f3b444e0775900cbe9376add9b85661" op:@2];
    
    //个人资料
    //[userAction getProfile:@15];
    
    //修改个人资料
    NSMutableDictionary *userinfo = [[[NSMutableDictionary alloc]
                                      initWithObjectsAndKeys:@15,@"uid",
                                      @"6f3b444e0775900cbe9376add9b85661", @"access_token",
                                      @"2", @"gender",
                                      @"justinaaaa", @"desc",
                                      @"hahahajustin", @"nickname",nil
                                      ]autorelease];
   
    //[userAction editProfile:userinfo];
    
    //===================================================
    //=====================goods=========================
    //===================================================
    GoodsAction *goodsAction = [GoodsAction action];
    goodsAction.resultErrorBlock = ^(id result){
        NSLog(@"%@---", result);
    };
    goodsAction.resultDataBlock = ^(id result){
        NSLog(@"%@----2", result);
    };

    //发布商品
    NSMutableDictionary *goodsinfo = [[[NSMutableDictionary alloc]
                                      initWithObjectsAndKeys:
                                      @15,@"uid",
                                      @"6f3b444e0775900cbe9376add9b85661", @"access_token",
                                      @"goods1", @"title",
                                      @"desc 1", @"desc",
                                      @"0", @"money",
                                       @"10.444", @"lon",
                                       @"108.33", @"lat",nil
                                      ]autorelease];
    //[goodsAction publish:goodsinfo];
    
    //修改商品
    NSMutableDictionary *goodsinfo2 = [[[NSMutableDictionary alloc]
                                       initWithObjectsAndKeys:
                                       @15,@"uid",
                                       @"6f3b444e0775900cbe9376add9b85661", @"access_token",
                                       @"15135927787235661",@"goods_id",
                                       @"goods1modiyf", @"title",
                                       @"desc 1 modify", @"desc",
                                       @"10", @"money",
                                       @"110.444", @"lon",
                                       @"118.33", @"lat",nil
                                       ]autorelease];
    //[goodsAction publish:goodsinfo2];
    
    //商品详情
    //[goodsAction detail:@"15135927787235661"];
    
    //下架商品
    //[goodsAction offline:@15 accessToken:@"6f3b444e0775900cbe9376add9b85661" goodsId:@"15135927787235661"];
    
    //商品列表
    NSMutableDictionary *params = [[[NSMutableDictionary alloc]
                                        initWithObjectsAndKeys:
                                        @"15",@"keyword",
                                        @"2",@"filter",
                                        @"0", @"status",nil
                                        ]autorelease];
    [goodsAction getList:params];
    
    //===================================================
    //==============goods comment========================
    //===================================================
    
    
    //===================================================
    //==================message==========================
    //===================================================
    
    
    //===================================================
    //====================image==========================
    //===================================================
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
