//
//  TWAppDelegateStyleSheet.m
//  thepearlqatar
//
//  Created by MarketingMac on 9/2/14.
//  Copyright (c) 2014 udc. All rights reserved.
//

#import "TWAppDelegateStyleSheet.h"


@implementation TWAppDelegateStyleSheet

// Strings
NSString * const kAppDelegateDemoStyleSheetImageIconError = @"icon_error.png";
NSString * const kAppDelegateDemoStyleSheetImageIconSuccess = @"icon_confirmation.png";
NSString * const kAppDelegateDemoStyleSheetImageIconInfo = @"icon_info.png";


#pragma mark - Alloc/Init

+ (TWAppDelegateStyleSheet *)styleSheet
{
    return [[TWAppDelegateStyleSheet alloc] init];
}

#pragma mark - TWMessageBarStyleSheet

- (UIColor *)backgroundColorForMessageType:(TWMessageBarMessageType)type
{
    UIColor *backgroundColor = nil;
    switch (type)
    {
            
        case TWMessageBarMessageTypeError:
            backgroundColor = UIColorFromRGB(0xB40000);
            break;
        case TWMessageBarMessageTypeSuccess:
            backgroundColor = UIColorFromRGB(0x06B400);
            break;
        case TWMessageBarMessageTypeInfo:
            backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.75];
            break;
        default:
            break;
//        case TWMessageBarMessageTypeError:
//            backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.90];
//            break;
//        case TWMessageBarMessageTypeSuccess:
//            backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.75];
//            break;
//        case TWMessageBarMessageTypeInfo:
//            backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.75];
//            break;
//        default:
//            break;
    }
    return backgroundColor;
}

- (UIColor *)strokeColorForMessageType:(TWMessageBarMessageType)type
{
    UIColor *strokeColor = nil;
    switch (type)
    {
        case TWMessageBarMessageTypeError:
            strokeColor = [UIColor colorWithRed:215.0 green:70.0 blue:59.0 alpha:0.90];
            break;
        case TWMessageBarMessageTypeSuccess:
            
            strokeColor = [UIColor colorWithRed:79.0 green:177.0 blue:107.0 alpha:1.0];
            break;
        case TWMessageBarMessageTypeInfo:
            strokeColor = [UIColor colorWithRed:43.0 green:172.0 blue:255.0 alpha:1.0];
            break;
        default:
            break;
    }
    return strokeColor;
}

- (UIImage *)iconImageForMessageType:(TWMessageBarMessageType)type
{
    UIImage *iconImage = nil;
    switch (type)
    {
        case TWMessageBarMessageTypeError:
            iconImage = [UIImage imageNamed:kAppDelegateDemoStyleSheetImageIconError];
            break;
        case TWMessageBarMessageTypeSuccess:
            iconImage = [UIImage imageNamed:kAppDelegateDemoStyleSheetImageIconSuccess];
            break;
        case TWMessageBarMessageTypeInfo:
            iconImage = [UIImage imageNamed:kAppDelegateDemoStyleSheetImageIconInfo];
            break;
        default:
            break;
    }
    return iconImage;
}

- (UIFont *)titleFontForMessageType:(TWMessageBarMessageType)type
{
    return [UIFont fontWithName:@"optima-bold" size:16.0f];
}

- (UIFont *)descriptionFontForMessageType:(TWMessageBarMessageType)type
{
    return [UIFont fontWithName:@"optima" size:14.0f];
}

- (UIColor *)titleColorForMessageType:(TWMessageBarMessageType)type
{
    return [UIColor whiteColor];
}

- (UIColor *)descriptionColorForMessageType:(TWMessageBarMessageType)type
{
    return [UIColor whiteColor];
}
@end
