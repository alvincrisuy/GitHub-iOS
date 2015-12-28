//
//  ReachabilityManager.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 27/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "ReachabilityManager.h"

#define USERDEFAULT_TOKEN_STRING @"token"
#define AF_HTTPHEADERFIELD_AUTHENTICATION @"Authorization"
#define AF_HTTPHEADERFIELD_AUTHENTICATION_VALUE @"Bearer %@"

#define LOG_API @"API: %@"

static ReachabilityManager* _sharedManager = nil;

@interface ReachabilityManager ()

- (void)startAFNetworkingReachability;
- (BOOL)isAFNetworkingConnected;

@end

@implementation ReachabilityManager

+ (ReachabilityManager *)sharedManager {
    
    @synchronized(self) {
        if (_sharedManager == nil) {
            _sharedManager = [[self alloc] init];
        }
    }
    
    return _sharedManager;
}

- (void)startAFNetworkingReachability {
    [self.manager.reachabilityManager startMonitoring];
}

- (BOOL)isAFNetworkingConnected {
    return self.manager.reachabilityManager.reachable;
}

- (void)getRequest:(NSString *)get
        parameters:(id)parameters
          progress:(RequestProgressBlock)progressBlock
           success:(RequestSuccessBlock)successBlock
            failed:(RequestFailedBlock)failedBlock
     authenticated:(BOOL)authenticated {
    
    [self initializeManagerAuthenticated:authenticated];
    
    RequestProgressBlock requestProgressBlock = ^(NSProgress *progress) {
        
        progressBlock(progress);
    };
    
    RequestSuccessBlock requestSuccessBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"Response Object: %@", responseObject);
        
        successBlock(task, responseObject);
    };
    
    RequestFailedBlock requestFailedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", [error description]);
        
        failedBlock(task, error);
    };
    
    NSLog(LOG_API, get);
    [self.manager GET:get parameters:parameters progress:requestProgressBlock success:requestSuccessBlock failure:requestFailedBlock];
}

- (void)postRequest:(NSString *)post
         parameters:(id)parameters
           progress:(RequestProgressBlock)progressBlock
            success:(RequestSuccessBlock)successBlock
             failed:(RequestFailedBlock)failedBlock
      authenticated:(BOOL)authenticated {
    
    [self initializeManagerAuthenticated:authenticated];
    
    RequestProgressBlock requestProgressBlock = ^(NSProgress *progress) {
        
        progressBlock(progress);
    };
    
    RequestSuccessBlock requestSuccessBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"Response Object: %@", responseObject);
        
        successBlock(task, responseObject);
    };
    
    RequestFailedBlock requestFailedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", [error description]);
        
        failedBlock(task, error);
    };
    
    NSLog(LOG_API, post);
    [self.manager POST:post parameters:parameters progress:requestProgressBlock success:requestSuccessBlock failure:requestFailedBlock];
}

- (void)initializeManagerAuthenticated:(BOOL)authenticated {
    self.manager = [AFHTTPSessionManager manager];
    
    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    if (authenticated) {
        NSString *token = [[NSUserDefaults standardUserDefaults]stringForKey:USERDEFAULT_TOKEN_STRING];
        [self.manager.requestSerializer setValue:[NSString stringWithFormat:AF_HTTPHEADERFIELD_AUTHENTICATION_VALUE, token]
                              forHTTPHeaderField:AF_HTTPHEADERFIELD_AUTHENTICATION];
    }
    
    [self startAFNetworkingReachability];
}

@end
