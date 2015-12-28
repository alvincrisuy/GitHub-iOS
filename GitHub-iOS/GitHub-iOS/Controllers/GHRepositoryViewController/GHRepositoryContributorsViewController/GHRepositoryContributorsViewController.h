//
//  GHRepositoryContributorsViewController.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GHBaseTableViewController.h"
#import "GHBaseTableViewDataSource.h"
#import "GHBaseTableViewDelegate.h"
#import "GHTabViewDelegate.h"
#import "GHRepositoryModel.h"

@interface GHRepositoryContributorsViewController : GHBaseTableViewController <GHBaseTableViewDataSource, GHBaseTableViewDelegate, GHTabViewDelegate>

@property (nonatomic, retain) GHRepositoryModel *model;

@end
