//
//  GHSearchManager.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHSearchManager.h"

#import "ReachabilityManager.h"
#import "ProgressHUD.h"
#import "NSArray+GHRepositoryModel.h"

@implementation GHSearchManager

+ (instancetype)sharedManager {
    static GHSearchManager *_sharedManager = nil;
    
    @synchronized(self) {
        if (_sharedManager == nil) {
            _sharedManager = [[self alloc] init];
        }
    }
    
    return _sharedManager;
}

- (void)requestWithParams:(NSDictionary *)parameters
            progressBlock:(RequestProgressBlock)progressBlock
              searchBlock:(RequestSearchBlock)searchBlock
              failedBlock:(RequestFailedBlock)failedBlock {
    
    [ProgressHUD show:@"Please wait..." Interaction:NO];
    
    RequestSuccessBlock successBlock = ^(NSURLSessionDataTask *task, id responseObject) {
        [ProgressHUD dismiss];
        
        NSArray* param = responseObject[@"items"];
        NSArray* paramArray = [param toGHRepositoryModelArrayFromResponseObject];
        
        searchBlock(paramArray);
    };
    
    [[ReachabilityManager sharedManager] getRequest:@"https://api.github.com/search/repositories"
                                         parameters:parameters
                                           progress:progressBlock
                                            success:successBlock
                                             failed:failedBlock
                                      authenticated:NO];
}

@end
