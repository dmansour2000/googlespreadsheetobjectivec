//
//  DatabaseHelper.m
//  Test App
//
//  Created by Dina Mansour on 9/8/18.
//  Copyright © 2018 StarWallet Labs. All rights reserved.
//

#import "DatabaseHelper.h"

@implementation DatabaseHelper

+(ImageModel *)getImages{
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    ImageModel *className = [[ImageModel alloc]init];
    NSData *dataretrieved = [currentDefaults objectForKey:@"IMAGES"];
    className = [NSKeyedUnarchiver unarchiveObjectWithData:dataretrieved];
    return className;
    
}

+(void)saveImages:(ImageModel *)images{
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:images];
    [currentDefaults setObject:data forKey:@"IMAGES"];
    [currentDefaults synchronize];
}

@end
