//
//  DatabaseHelper.h
//  Test App
//
//  Created by Dina Mansour on 9/8/18.

//

#import <Foundation/Foundation.h>
#import "ImageModel.h"

@interface DatabaseHelper : NSObject

+(ImageModel *)getImages;
+(void)saveImages:(ImageModel *)images;

@end
