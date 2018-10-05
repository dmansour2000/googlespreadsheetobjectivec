//
//  BaseViewController.m
//  Test App
//
//  Created by Dina Mansour on 9/8/18.

//
#import "BaseViewController.h"


@interface BaseViewController (){
    AppDelegate *appDelegate;
}

@end

@implementation BaseViewController
-(void)viewWillAppear:(BOOL)animated {
    
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.navigationController.navigationBarHidden = YES;
    appDelegate.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    appDelegate.navigationController.navigationBar.tintColor = UIColor.whiteColor;
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}





#pragma mark - Internet
-(BOOL)hasInternet{
    return [(AppDelegate *)[[UIApplication sharedApplication] delegate] hasInternet] ;
}

-(void)checkConnection{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    if ([reachability currentReachabilityStatus] == NotReachable) {
        [UIHelper showErrorMessage:Localized(@"NoNetworkMSG") Title:ApplicationName];
        return;
    }
}



@end
