//
//  GHRepositoryModel.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHRepositoryModel : NSObject

@property (nonatomic, assign) NSInteger repositoryId;
@property (nonatomic, retain) NSString *repositoryName;
@property (nonatomic, retain) NSString *repositoryFullName;
@property (nonatomic, retain) NSString *repositoryDescription;
@property (nonatomic, retain) NSString *repositoryLanguage;
@property (nonatomic, assign) NSInteger repositoryStarGazersCount;
@property (nonatomic, assign) NSInteger repositoryForksCount;
@property (nonatomic, retain) NSString *repositoryURL;

@property (nonatomic, retain) NSString *repositoryContributorsURL;
@property (nonatomic, retain) NSString *repositoryIssuesURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
