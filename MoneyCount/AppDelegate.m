//
//  AppDelegate.m
//  MoneyCount
//
//  Created by Adrian Polo Alcaide on 01/02/16.
//  Copyright © 2016 Adrian Polo Alcaide. All rights reserved.
//

#import "AppDelegate.h"
#import "APBroker.h"
#import "APWalletTableViewController.h"
#import "APWallet.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    APWallet *wallet = [[APWallet alloc] initWithAmount:10 currency:@"USD"];
    [wallet plus:[APMoney dollarWithAmount:10]];
    [wallet plus:[APMoney euroWithAmount:20]];
    [wallet plus:[APMoney euroWithAmount:1]];
    [wallet plus:[APMoney dollarWithAmount:4]];
    
    APBroker *broker = [APBroker new];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [[APWalletTableViewController alloc] initWithModel:wallet broker:broker];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
