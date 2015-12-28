//
//  GHCommon.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GHRepositoryModel;

@interface GHCommon : NSObject

@property (nonatomic, retain) NSArray *asciiBack;
@property (nonatomic, retain) NSArray *asciiStar;
@property (nonatomic, retain) NSArray *asciiFork;

@property (nonatomic, retain) GHRepositoryModel *repositoryModel;

+ (GHCommon *)sharedInstance;

@end
