//
//  BaseViewController.h
//  Test App
//
//  Created by Dina Mansour on 9/8/18.

//

#import <UIKit/UIKit.h>


@interface BaseViewController : UIViewController<UIApplicationDelegate, ResponseDelegate>

-(BOOL)hasInternet;
-(void)checkConnection;
@end
