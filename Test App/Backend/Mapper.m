//
//  Mapper.m
//  Test App
//
//  Created by Dina Mansour on 9/9/18.

//

#import "Mapper.h"
#import "BaseModel.h"
#import "RowsModel.h"



@implementation Mapper


+(RKObjectMapping *)getBasicMapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[BaseModel class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"spreadsheetId" : @"spreadsheetId"
                                                 
                                                 
                                                  }];
    return mapping;
}

+(RKObjectMapping *)getMapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[RowsModel class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"range" : @"range",
                                                  @"majorDimension" : @"majorDimension",
                                                  @"values" : @"values"
                                                
                                                  
                                                  }];
    return mapping;
}



@end
