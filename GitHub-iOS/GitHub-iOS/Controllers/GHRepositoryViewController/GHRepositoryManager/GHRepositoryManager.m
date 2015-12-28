//
//  GHRepositoryManager.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHRepositoryManager.h"

#import "ReachabilityManager.h"
#import "ProgressHUD.h"
#import "NSArray+GHIssueModel.h"
#import "NSArray+GHContributorModel.h"

static GHRepositoryManager *_sharedManager = nil;

@implementation GHRepositoryManager

+ (instancetype)sharedManager {
    
    @synchronized(self) {
        if (_sharedManager == nil) {
            _sharedManager = [[self alloc] init];
        }
    }
    
    return _sharedManager;
}

- (void)requestWithAPI:(NSString *)api
                params:(NSDictionary *)parameters
         progressBlock:(RequestProgressBlock)progressBlock
      contributorBlock:(RequestContributorsBlock)contributorBlock
           failedBlock:(RequestFailedBlock)failedBlock {
    
    RequestSuccessBlock successBlock = ^(NSURLSessionDataTask *task, id responseObject) {

        NSArray* param = responseObject;
        NSArray* paramArray = [param toGHContributorModelArrayFromResponseObject];
        
        contributorBlock(paramArray);
    };
    
    [[ReachabilityManager sharedManager] getRequest:api
                                         parameters:parameters
                                           progress:progressBlock
                                            success:successBlock
                                             failed:failedBlock
                                      authenticated:NO];
}

- (void)requestWithAPI:(NSString *)api
                params:(NSDictionary *)parameters
         progressBlock:(RequestProgressBlock)progressBlock
            issueBlock:(RequestIssuesBlock)issueBlock
           failedBlock:(RequestFailedBlock)failedBlock {

    RequestSuccessBlock successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        
        NSArray* param = responseObject;
        NSArray* paramArray = [param toGHIssueModelArrayFromResponseObject];
        
        issueBlock(paramArray);
    };
    
    [[ReachabilityManager sharedManager] getRequest:api
                                         parameters:parameters
                                           progress:progressBlock
                                            success:successBlock
                                             failed:failedBlock
                                      authenticated:NO];
}

@end
