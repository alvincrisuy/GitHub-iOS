//
//  GHRepositoryContributorsViewController.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHRepositoryContributorsViewController.h"

#import "GHCommon.h"
#import "GHBaseTableView.h"
#import "GHRepositoryContributorsTableViewCell.h"
#import "GHContributorModel.h"
#import "GHRepositoryManager.h"

#import "ProgressHUD.h"

@interface GHRepositoryContributorsViewController () {
    GHRepositoryManager *apiManager;
}

@property (nonatomic, retain) NSMutableArray *dataSourceArray;

@end

@implementation GHRepositoryContributorsViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    
    apiManager = [GHRepositoryManager sharedManager];
    
    self.dataSourceArray = [NSMutableArray array];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self reloadTableViewDataSource];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadTableViewDataSource {
    __block GHRepositoryContributorsViewController* viewSelf = self;

    RequestProgressBlock progressBlock = ^(NSProgress *progress) {
        
    };
    
    RequestContributorsBlock contributionBlock = ^(NSArray *list) {
        [viewSelf.dataSourceArray setArray:list];
        [viewSelf.tableView reloadData];
    };
    
    RequestFailedBlock failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {

    };
    
    [[GHRepositoryManager sharedManager] requestWithAPI:[NSString stringWithFormat:@"%@/contributors", [GHCommon sharedInstance].repositoryModel.repositoryURL]
                                                 params:nil
                                          progressBlock:progressBlock
                                       contributorBlock:contributionBlock
                                            failedBlock:failedBlock];
}

#pragma mark - GHBaseTableView

- (NSInteger)numberOfSectionsInTableView:(GHBaseTableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(GHBaseTableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(GHBaseTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [GHRepositoryContributorsTableViewCell cellHeightWithStyle:GHRepositoryContributorsCellStyleRow0];
}

- (UITableViewCell *)tableView:(GHBaseTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* CELL_ID = @"";
    
    GHRepositoryContributorsTableViewCell *cell = (GHRepositoryContributorsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    NSInteger index = indexPath.row;
    
    if (cell == nil) {
        cell = [GHRepositoryContributorsTableViewCell cellFromNib:GHRepositoryContributorsCellStyleRow0];
    }
    
    if ([self.dataSourceArray count] > 0) {
        GHContributorModel *model = [self.dataSourceArray objectAtIndex:index];
        [cell setCell:model];
    }
    
    return cell;
}

#pragma mark - GHBaseTab

- (NSString *)titleForTabSectionInRootTabViewController {
    return @"Contributors";
}

@end
