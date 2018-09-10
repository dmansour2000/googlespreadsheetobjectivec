//
//  TWAppDelegateStyleSheet.h
//  thepearlqatar
//
//  Created by MarketingMac on 9/2/14.
//  Copyright (c) 2014 udc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TWMessageBarManager.h"

@interface TWAppDelegateStyleSheet : NSObject<TWMessageBarStyleSheet>

+ (TWAppDelegateStyleSheet *)styleSheet;
@end
