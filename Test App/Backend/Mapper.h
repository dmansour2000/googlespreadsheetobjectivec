//
//  Mapper.h
//  Test App
//
//  Created by Dina Mansour on 9/9/18.
//  Copyright © 2018 StarWallet Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mapper : NSObject
+(RKObjectMapping *)getBasicMapping;
+(RKObjectMapping *)getMapping ;
+(RKObjectMapping *)getValuesMapping;

@end
