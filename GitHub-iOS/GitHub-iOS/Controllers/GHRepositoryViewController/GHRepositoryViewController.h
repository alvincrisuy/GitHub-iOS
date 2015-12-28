//
//  GHRepositoryViewController.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 27/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GHTabViewController.h"

@class GHRepositoryIssuesViewController;
@class GHRepositoryContributorsViewController;

@class GHRepositoryModel;

@interface GHRepositoryViewController : GHTabViewController

@property (nonatomic, retain) GHRepositoryModel *repository;

@property (nonatomic, retain) GHRepositoryIssuesViewController *issuesViewController;
@property (nonatomic, retain) GHRepositoryContributorsViewController *contributorsViewController;

@property (nonatomic, retain) IBOutlet UILabel *fullName;
@property (nonatomic, retain) IBOutlet UILabel *glazerCount;
@property (nonatomic, retain) IBOutlet UILabel *forkCount;
@property (nonatomic, retain) IBOutlet UILabel *language;
@property (nonatomic, retain) IBOutlet UILabel *desc;

@property (nonatomic, retain) IBOutlet UIImageView *starredImageView;
@property (nonatomic, retain) IBOutlet UIImageView *forkedImageView;

@end
