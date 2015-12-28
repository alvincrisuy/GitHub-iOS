//
//  GHContributorModel.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHContributorModel.h"
#import "NSDictionary+NullCheck.h"

@implementation GHContributorModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        SetIntValueIfNotNullForKey(self.contributorId, dictionary, @"id")
        SetValueIfNotNullForKey(self.contributorLogin, dictionary, @"login")
        SetValueIfNotNullForKey(self.contributorAvatarURL, dictionary, @"avatar_url")
        SetIntValueIfNotNullForKey(self.contributorContributionsCount, dictionary, @"contributions")
    }
    
    return self;
}

@end
