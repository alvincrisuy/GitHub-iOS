//
//  ReachabilityManager.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 27/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void (^RequestProgressBlock)(NSProgress *progress);
typedef void (^RequestSuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^RequestFailedBlock)(NSURLSessionDataTask *task, NSError *error);

@interface ReachabilityManager : NSObject

@property (nonatomic, retain) AFHTTPSessionManager *manager;

+ (ReachabilityManager *)sharedManager;

- (void)getRequest:(NSString *)get
        parameters:(id)parameters
          progress:(RequestProgressBlock)progressBlock
           success:(RequestSuccessBlock)successBlock
            failed:(RequestFailedBlock)failedBlock
     authenticated:(BOOL)authenticated;
- (void)postRequest:(NSString *)post
         parameters:(id)parameters
           progress:(RequestProgressBlock)progressBlock
            success:(RequestSuccessBlock)successBlock
             failed:(RequestFailedBlock)failedBlock
      authenticated:(BOOL)authenticated;

@end
