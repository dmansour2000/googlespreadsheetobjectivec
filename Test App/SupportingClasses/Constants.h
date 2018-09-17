//
//  Constants.h
//  Test App
//
//  Created by Dina Mansour on 9/8/18.
//  Copyright © 2018 StarWallet Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define KBackendType KBackendWS
#define NSLocalizedString(key, comment) [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]

// Customized Constants
#define ApplicationName @"StarWallet labs"

#define BASEURL @"https://sheets.googleapis.com/v4/spreadsheets/1tZJ13FikGkuw_HmmTLhY9QOTyZ5DeJm6tXM7oVAYetE/values:batchGet?ranges=Sheet1!A:A&ranges=Sheet1!C:C&majorDimension=COLUMNS&key=AIzaSyATIgNaNipzppfuw-EPeYSIgZ1ysPZpUco"







#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//Application langauge
//#define Localized(key) \
//NSLocalizedString(key, key)
#define Localized(key) \
[[Localisator sharedInstance] localizedStringForKey:(key)]

//Static Colors
#define StaticDarkColor 0x888888
#define StaticShadowColor 0x818382
#define StaticFontColor 0x666666
#define StaticFadedFontColor 0xdddddd
#define StaticLightFontColor 0xffffff




// color name
#define FONT @"CourierNewPS-BoldMT"

#define MaxConnectionRetryCount 5

#define isDebugMode   @"1"




