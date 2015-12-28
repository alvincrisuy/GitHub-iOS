//
//  GHContributorModel.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHContributorModel : NSObject

@property (nonatomic, assign) NSInteger contributorId;
@property (nonatomic, retain) NSString *contributorLogin;
@property (nonatomic, retain) NSString *contributorAvatarURL;
@property (nonatomic, assign) NSInteger contributorContributionsCount;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end