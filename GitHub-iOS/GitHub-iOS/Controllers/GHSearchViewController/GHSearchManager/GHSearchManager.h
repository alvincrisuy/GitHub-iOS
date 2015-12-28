//
//  GHSearchManager.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "ReachabilityManager.h"

typedef void (^RequestSearchBlock)(NSArray *list);

@interface GHSearchManager : ReachabilityManager

+ (instancetype)sharedManager;

- (void)requestWithParams:(NSDictionary *)parameters
            progressBlock:(RequestProgressBlock)progressBlock
              searchBlock:(RequestSearchBlock)searchBlock
              failedBlock:(RequestFailedBlock)failedBlock;

@end