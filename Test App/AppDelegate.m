//
//  AppDelegate.m
//  Test App
//
//  Created by Dina Mansour on 9/8/18.
//  Copyright © 2018 StarWallet Labs. All rights reserved.
//

#import "AppDelegate.h"
#import "GTLRSheets.h"
#import "AppAuth.h"

@interface AppDelegate ()
{
    Reachability *reachability;
    
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    
    
     self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    

    
    
    [self setUpRechability];

    
   MainViewController *mainView = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:mainView];
    self.navigationController.navigationBarHidden = YES;
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    
   
  
    
 
    
    return YES;
}
#pragma mark - Reachability

- (void)setUpRechability {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNetworkChange:) name:kReachabilityChangedNotification object:nil];
    
    reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
    if (remoteHostStatus == NotReachable) {
        NSLog(@"no");
        self.hasInternet = NO;
    } else if (remoteHostStatus == ReachableViaWiFi) {
        NSLog(@"wifi");
        self.hasInternet = YES;
    } else if (remoteHostStatus == ReachableViaWWAN) {
        NSLog(@"cell");
        self.hasInternet = YES;
    }
    
}

- (void)handleNetworkChange:(NSNotification *)notice {
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
    if (remoteHostStatus == NotReachable) {
        NSLog(@"no");
        self.hasInternet = NO;
    } else if (remoteHostStatus == ReachableViaWiFi) {
        NSLog(@"wifi");
        self.hasInternet = YES;
    } else if (remoteHostStatus == ReachableViaWWAN) {
        NSLog(@"cell");
        self.hasInternet = YES;
    }
    
    if (!self.hasInternet) {
        [UIHelper showErrorMessage:Localized(@"NoNetworkMSG") Title:Localized(@"Error")];
    }
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
