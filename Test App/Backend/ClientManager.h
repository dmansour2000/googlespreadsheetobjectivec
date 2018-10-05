//
//  ClientManager.h
//  Test App
//
//  Created by Dina Mansour on 9/9/18.

//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@protocol ResponseDelegate
@required
-(void)requestWillSend:(NSURLRequest *)request;
-(void)successResponse:(RKObjectRequestOperation *)operation  mappingresult:(NSArray *)mappingResult;
-(void)failuerResponse:(RKObjectRequestOperation *)operation error: (NSError *)error;
@end

@protocol Backend
@required
// All Backend Call Methods here

-(void)getSheet:(id<ResponseDelegate>)delegate;


@end

@interface ClientManager : NSObject
+(id<Backend>)createInstance;
-(void)startOperationForRequest:(NSURLRequest *)request andDescriptor:(NSArray *)responseDescriptor withDelegate:(id<ResponseDelegate>)delegate;
-(void)startOperationForRequestAndSaveToLocal:(NSURLRequest *)request andDescriptor:(NSArray *)responseDescriptor andObjectManager:(RKObjectManager*)objectManager withDelegate:(id<ResponseDelegate>)delegate;
-(void)startOperationForRequestWithoutRetry:(NSMutableURLRequest *)request andDescriptor:(NSArray *)responseDescriptor  withDelegate:(id<ResponseDelegate>)delegate;
@end
