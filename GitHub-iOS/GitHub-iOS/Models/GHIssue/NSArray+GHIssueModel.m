//
//  NSArray+GHIssueModel.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "NSArray+GHIssueModel.h"
#import "GHIssueModel.h"

@implementation NSArray (GHIssueModel)

- (NSArray *)toGHIssueModelArrayFromResponseObject {
    NSArray *responseObject = self;
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dictionary in responseObject) {
        GHIssueModel *issueModel = [[GHIssueModel alloc] initWithDictionary:dictionary];
        [array addObject:issueModel];
    }
    
    return array;
}

@end
