//
//  GHIssueModel.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHIssueModel.h"
#import "NSDictionary+NullCheck.h"

@implementation GHIssueModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        SetIntValueIfNotNullForKey(self.issueId, dictionary, @"id")
        SetValueIfNotNullForKey(self.issueTitle, dictionary, @"title")
        SetValueIfNotNullForKey(self.issueBody, dictionary, @"body")
        SetIntValueIfNotNullForKey(self.issueCommentCount, dictionary, @"comments")
        SetIntValueIfNotNullForKey(self.issueNumber, dictionary, @"number")
    }
    
    return self;
}

@end
