//
//  Logger.m
//  Test App
//
//  Created by Dina Mansour on 9/9/18.
//  Copyright © 2018 StarWallet Labs. All rights reserved.
//

#import "Logger.h"

@implementation Logger

+(void) debugMessage:(NSString *) tag andMessage:(NSString *) message{
    if([isDebugMode isEqualToString:@"1"])
        NSLog(@"%@ : %@", tag, message);
}

+(void) debugError:(NSString *) tag andMessage:(NSString *) message{
    if([isDebugMode isEqualToString:@"1"])
        NSLog(@"Error In %@ : %@", tag, message);
}
@end
