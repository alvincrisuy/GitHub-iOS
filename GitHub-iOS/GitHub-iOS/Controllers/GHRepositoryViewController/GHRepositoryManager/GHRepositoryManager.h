//
//  GHRepositoryManager.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "ReachabilityManager.h"

typedef void (^RequestIssuesBlock)(NSArray *list);
typedef void (^RequestContributorsBlock)(NSArray *list);

@interface GHRepositoryManager : ReachabilityManager

+ (instancetype)sharedManager;

- (void)requestWithAPI:(NSString *)api
                params:(NSDictionary *)parameters
         progressBlock:(RequestProgressBlock)progressBlock
            issueBlock:(RequestIssuesBlock)issueBlock
           failedBlock:(RequestFailedBlock)failedBlock;

- (void)requestWithAPI:(NSString *)api
                params:(NSDictionary *)parameters
         progressBlock:(RequestProgressBlock)progressBlock
      contributorBlock:(RequestContributorsBlock)contributorBlock
           failedBlock:(RequestFailedBlock)failedBlock;

@end
