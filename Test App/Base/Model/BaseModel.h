//
//  BaseModel.h
//  Test App
//
//  Created by Dina Mansour on 9/9/18.

//

#import <Foundation/Foundation.h>
#import "RowsModel.h"
@interface BaseModel : NSObject

@property (copy, nonatomic) NSString *spreadsheetId;
@property (copy, nonatomic) NSArray<RowsModel*> *valueRanges;


@end
