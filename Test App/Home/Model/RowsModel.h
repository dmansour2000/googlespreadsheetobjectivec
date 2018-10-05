//
//  RowsModel.h
//  Test App
//
//  Created by Dina Mansour on 9/9/18.

//

#import <Foundation/Foundation.h>
@interface RowsModel : NSObject

@property (copy, nonatomic) NSString *range;
@property (copy, nonatomic) NSString *majorDimension;
@property (copy, nonatomic) NSArray<NSString*> *values;


@end
