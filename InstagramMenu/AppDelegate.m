//
//  AppDelegate.m
//  InstagramMenu
//
//  Created by Sacchy on 12/09/02.
//  Copyright (c) 2012年 Sacchy. All rights reserved.
//

#import "AppDelegate.h"
#import "InstagramMenuTestViewController.h"

@implementation AppDelegate
@synthesize window;
@synthesize imtvc;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    imtvc = [[InstagramMenuTestViewController alloc] init];
    UINavigationController *imtnav = [[UINavigationController alloc] initWithRootViewController:imtvc];
    [self.window addSubview:imtnav.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
