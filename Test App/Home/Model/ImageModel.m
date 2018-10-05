//
//  ImageModel.m
//  Test App
//
//  Created by Dina Mansour on 9/8/18.

//

#import "ImageModel.h"

@implementation ImageModel
- (void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode properties, other class variables, etc
    [encoder encodeObject:_images forKey:@"Images"];
  
    
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super init]))
    {
        //decode properties, other class vars
        _images = [decoder decodeObjectForKey:@"Images"];
        
        
        
    }
    return self;
}
@end
