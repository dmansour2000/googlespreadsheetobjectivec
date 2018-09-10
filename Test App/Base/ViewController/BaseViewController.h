//
//  BaseViewController.h
//  Test App
//
//  Created by Dina Mansour on 9/8/18.
//  Copyright © 2018 StarWallet Labs. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseViewController : UIViewController<UIApplicationDelegate, ResponseDelegate>

-(BOOL)hasInternet;
-(void)checkConnection;
@end
