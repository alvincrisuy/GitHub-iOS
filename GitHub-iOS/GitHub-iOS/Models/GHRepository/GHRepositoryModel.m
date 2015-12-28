//
//  GHRepositoryModel.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHRepositoryModel.h"
#import "NSDictionary+NullCheck.h"

@implementation GHRepositoryModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        SetIntValueIfNotNullForKey(self.repositoryId, dictionary, @"id")
        SetValueIfNotNullForKey(self.repositoryName, dictionary, @"name")
        SetValueIfNotNullForKey(self.repositoryFullName, dictionary, @"full_name")
        SetValueIfNotNullForKey(self.repositoryDescription, dictionary, @"description")
        SetValueIfNotNullForKey(self.repositoryLanguage, dictionary, @"language")
        SetIntValueIfNotNullForKey(self.repositoryStarGazersCount, dictionary, @"stargazers_count")
        SetIntValueIfNotNullForKey(self.repositoryForksCount, dictionary, @"forks_count")
        
        SetValueIfNotNullForKey(self.repositoryContributorsURL, dictionary, @"contributors_url")
        SetValueIfNotNullForKey(self.repositoryIssuesURL, dictionary, @"issues_url")
    }
    
    return self;
    
}

@end
