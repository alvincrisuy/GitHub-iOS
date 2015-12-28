//
//  NSArray+GHRepositoryModel.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "NSArray+GHRepositoryModel.h"
#import "GHRepositoryModel.h"

@implementation NSArray (GHRepositoryModel)

- (NSArray *)toGHRepositoryModelArrayFromResponseObject {
    NSArray *responseObject = self;
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dictionary in responseObject) {
        GHRepositoryModel *repositoryModel = [[GHRepositoryModel alloc] initWithDictionary:dictionary];
        [array addObject:repositoryModel];
    }
    
    return array;
}

@end
