//
//  Mapper.h
//  Test App
//
//  Created by Dina Mansour on 9/9/18.

//

#import <Foundation/Foundation.h>

@interface Mapper : NSObject
+(RKObjectMapping *)getBasicMapping;
+(RKObjectMapping *)getMapping ;
+(RKObjectMapping *)getValuesMapping;

@end
