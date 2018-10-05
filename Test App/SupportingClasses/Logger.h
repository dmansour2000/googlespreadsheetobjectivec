//
//  Logger.h
//  Test App
//
//  Created by Dina Mansour on 9/9/18.

//

#import <Foundation/Foundation.h>

@interface Logger : NSObject
+(void) debugMessage:(NSString *) tag andMessage:(NSString *) message;
+(void) debugError:(NSString *) tag andMessage:(NSString *) message;

@end
