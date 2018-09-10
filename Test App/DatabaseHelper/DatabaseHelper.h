//
//  DatabaseHelper.h
//  Test App
//
//  Created by Dina Mansour on 9/8/18.
//  Copyright © 2018 StarWallet Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageModel.h"

@interface DatabaseHelper : NSObject

+(ImageModel *)getImages;
+(void)saveImages:(ImageModel *)images;

@end
