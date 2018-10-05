//
//  ClientManager.m
//  Test App
//
//  Created by Dina Mansour on 9/9/18.

//

#import "ClientManager.h"
#import "BackendWS.h"
#import "Mapper.h"
#import "AppDelegate.h"


int retryCounter = 0;
@implementation ClientManager
id<Backend> backend ;
+(id<Backend>)createInstance{
    
    if (backend == nil){
        backend = [BackendWS new];
    }
    
    return backend;
}

-(void)startOperationForRequest:(NSMutableURLRequest *)request andDescriptor:(NSArray *)responseDescriptor  withDelegate:(id<ResponseDelegate>)delegate{
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    
    NSMutableString *urlStr = [NSMutableString stringWithString:[request.URL absoluteString]];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [request setURL:[NSURL URLWithString:urlStr]];
    //[request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    RKObjectRequestOperation *_operation = [[RKObjectRequestOperation alloc] initWithRequest:request                 responseDescriptors:responseDescriptor];
    
    [_operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        [delegate successResponse:operation mappingresult:[mappingResult array]];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        retryCounter++;
        if (retryCounter <= MaxConnectionRetryCount) {
            NSString    *urlstr =  [[[[operation HTTPRequestOperation] request] URL] absoluteString];
            [Logger debugError:urlstr andMessage:[NSString stringWithFormat:@"Retry Operation :%i", retryCounter]];
            // send this request again
            [self startOperationForRequest:request andDescriptor:responseDescriptor withDelegate:delegate];
        } else {
            retryCounter = 0;
            NSInteger statusCode = operation.HTTPRequestOperation.response.statusCode;
            switch (statusCode) {
                case 200:
                    //                    [delegate failuerResponse:operation error:error];
                    break;
                case 400:
                    [delegate failuerResponse:operation error:error];
                    break;
                case 401:
                {
                    [delegate failuerResponse:operation error:error];
                }
                    break;
                case 404:
                {
                    //                    [self unautorizedAccessToBackend];
                }
                    break;
                default:
                {
                    [delegate failuerResponse:operation error:error];
                }
                    break;
            }
        }
    }];
    
    [delegate requestWillSend:request];
    [_operation performSelectorInBackground:@selector(start) withObject:nil];
}

#pragma mark - GetData and Save Local
-(void)startOperationForRequestAndSaveToLocal:(NSMutableURLRequest *)request andDescriptor:(NSArray *)responseDescriptor andObjectManager:(RKObjectManager *)objectManager withDelegate:(id<ResponseDelegate>)delegate {
    
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    AppDelegate * appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSMutableString *urlStr = [NSMutableString stringWithString:[request.URL absoluteString]];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [request setURL:[NSURL URLWithString:urlStr]];
    NSLog(@"URL String:%@", urlStr);
    
    // [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    RKManagedObjectRequestOperation *_operation = [[RKManagedObjectRequestOperation alloc]initWithRequest:request responseDescriptors:responseDescriptor];
    
    _operation = [objectManager managedObjectRequestOperationWithRequest:request managedObjectContext:objectManager.managedObjectStore.mainQueueManagedObjectContext success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        
        [delegate successResponse:operation mappingresult:[mappingResult array]];
       
    }failure: ^(RKObjectRequestOperation *operation, NSError *error) {
        retryCounter++;
        // check if reach max retries
        if (retryCounter <= MaxConnectionRetryCount) {
            NSString    *urlstr =  [[[[operation HTTPRequestOperation] request] URL] absoluteString];
            [Logger debugError:urlstr andMessage:[NSString stringWithFormat:@"Retry Operation :%i", retryCounter]];
            // send this request again
            [self startOperationForRequestAndSaveToLocal:request andDescriptor:responseDescriptor andObjectManager:objectManager withDelegate:delegate];
        } else {
            retryCounter = 0;
            NSInteger statusCode = operation.HTTPRequestOperation.response.statusCode;
            switch (statusCode) {
                case 200:
                    // [delegate failuerResponse:operation error:error];
                    break;
                case 400:
                    [delegate failuerResponse:operation error:error];
                    break;
                case 401:
                {
                    [delegate failuerResponse:operation error:error];
                }
                    break;
                case 404:
                {
                    //                    [self unautorizedAccessToBackend];
                }
                    break;
                default:
                {
                    [delegate failuerResponse:operation error:error];
                }
                    break;
            }
        }
    }];
    [delegate requestWillSend:request];
    [_operation performSelectorInBackground:@selector(start) withObject:nil];
    
}

#pragma mark - StartRequest WithoutRetry
-(void)startOperationForRequestWithoutRetry:(NSMutableURLRequest *)request andDescriptor:(NSArray *)responseDescriptor withDelegate:(id<ResponseDelegate>)delegate {
    
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    
    NSMutableString *urlStr = [NSMutableString stringWithString:[request.URL absoluteString]];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [request setURL:[NSURL URLWithString:urlStr]];
    //    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    RKObjectRequestOperation *_operation = [[RKObjectRequestOperation alloc] initWithRequest:request                 responseDescriptors:responseDescriptor];
    
    [_operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        [delegate successResponse:operation mappingresult:[mappingResult array]];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSInteger statusCode = operation.HTTPRequestOperation.response.statusCode;
        NSString    *urlstr =  [[[[operation HTTPRequestOperation] request] URL] absoluteString];
        [Logger debugError:urlstr andMessage:[NSString stringWithFormat:@"Failed Operation :%ld", (long)statusCode]];
        
        switch (statusCode) {
            case 200:
                [delegate failuerResponse:operation error:error];
                break;
            case 400:
                [delegate failuerResponse:operation error:error];
                break;
            case 401:
            {
                [delegate failuerResponse:operation error:error];
            }
                break;
            case 404:
            {
                
            }
                break;
            default:
            {
                [delegate failuerResponse:operation error:error];
            }
                break;
        }
    }];
    
    [delegate requestWillSend:request];
    [_operation performSelectorInBackground:@selector(start) withObject:nil];
}

@end

