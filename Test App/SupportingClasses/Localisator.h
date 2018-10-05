//
//  Localisator.h
//  Test App
//
//  Created by Dina Mansour on 9/8/18.

//

#import <Foundation/Foundation.h>

//#define LOCALIZATION(text) [[Localisator sharedInstance] localizedStringForKey:(text)]

static NSString * const kNotificationLanguageChanged = @"kNotificationLanguageChanged";



@interface Localisator : NSObject

@property (nonatomic, readonly) NSArray* availableLanguagesArray;
@property (nonatomic, assign) BOOL saveInUserDefaults;
@property NSString * currentLanguage;

+ (Localisator*)sharedInstance;
-(NSString *)localizedStringForKey:(NSString*)key;
-(BOOL)setLanguage:(NSString*)newLanguage;

@end
