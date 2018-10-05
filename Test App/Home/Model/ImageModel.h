//
//  ImageModel.h
//  Test App
//
//  Created by Dina Mansour on 9/8/18.

//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject

@property (copy, nonatomic) NSArray<NSString*> *images;

- (void)encodeWithCoder:(NSCoder *)encoder;
- (id)initWithCoder:(NSCoder *)decoder;
@end
