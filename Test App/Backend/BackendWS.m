//
//  BackendWS.m
//  Test App
//
//  Created by Dina Mansour on 9/9/18.
//  Copyright © 2018 StarWallet Labs. All rights reserved.
//

#import "BackendWS.h"
#import "Mapper.h"
#import "AppDelegate.h"

@implementation BackendWS
__weak id weakDelegateBackendWS;

-(void)getSheet:(id<ResponseDelegate>)delegate {
    NSIndexSet *statusCodeSet = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);
    
    AppDelegate * appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    RKObjectMapping *basicMapping =[Mapper getBasicMapping];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:basicMapping method:RKRequestMethodGET pathPattern:nil keyPath:@"" statusCodes:statusCodeSet];
    
    RKObjectMapping * Mapping = [Mapper getMapping];
    
    
    RKRelationshipMapping * RelationShipMapping = [RKRelationshipMapping relationshipMappingFromKeyPath:@"valueRanges"
                                                                                                       toKeyPath:@"valueRanges"
                                                                                                    withMapping:Mapping];
    
    [basicMapping addPropertyMapping:RelationShipMapping];
    

    
    
    
    
    NSString *urlStr =[NSString stringWithFormat:@"%@", BASEURL];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
   [request setHTTPMethod:@"GET"];
    
    
    
   [self startOperationForRequest:request andDescriptor:@[responseDescriptor] withDelegate:delegate];
}

@end
