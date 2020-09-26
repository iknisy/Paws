//
//  AppDelegate.m
//  Paws
//
//  Created by 陳昱宏 on 2020/9/12.
//  Copyright © 2020 iknisy. All rights reserved.
//

#import "AppDelegate.h"
#import "CatsTableViewController.h"
@import Firebase;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [FIRApp configure];
    
//    UINavigationBar.appearance.tintColor = [UIColor colorWithRed:0.05 green:0.47 blue:0.91 alpha:1.0];
//    UINavigationBar.appearance.barTintColor = [UIColor colorWithRed:0.05 green:0.47 blue:0.91 alpha:1.0];
//    UINavigationBar.appearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
//    
//    CatsTableViewController *tableVC = [[CatsTableViewController alloc] init];
//    tableVC.title = @"Paws";
//    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:tableVC];
//    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
//    self.window.rootViewController = naviController;
//    [self.window makeKeyAndVisible];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
