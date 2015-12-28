//
//  NSArray+GHContributorModel.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "NSArray+GHContributorModel.h"
#import "GHContributorModel.h"

@implementation NSArray (GHContributorModel)

- (NSArray *)toGHContributorModelArrayFromResponseObject {
    NSArray *responseObject = self;
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dictionary in responseObject) {
        GHContributorModel *contributorModel = [[GHContributorModel alloc] initWithDictionary:dictionary];
        [array addObject:contributorModel];
    }
    
    return array;
}

@end
