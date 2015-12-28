//
//  GHRepositoryIssuesViewController.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHRepositoryIssuesViewController.h"

#import "GHCommon.h"
#import "GHBaseTableView.h"
#import "GHRepositoryIssuesTableViewCell.h"
#import "GHIssueModel.h"
#import "GHRepositoryManager.h"

#import "ProgressHUD.h"

@interface GHRepositoryIssuesViewController () {
    GHRepositoryManager *apiManager;
}

@property (nonatomic, retain) NSMutableArray *dataSourceArray;

@end

@implementation GHRepositoryIssuesViewController

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
    
    [self reloadTableViewDataSource];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadTableViewDataSource {
    __block GHRepositoryIssuesViewController* viewSelf = self;
    
    RequestProgressBlock progressBlock = ^(NSProgress *progress) {
        
    };
    
    RequestIssuesBlock issueBlock = ^(NSArray *list) {
        [viewSelf.dataSourceArray setArray:list];
        [viewSelf.tableView reloadData];
    };
    
    RequestFailedBlock failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {

    };
    
    [[GHRepositoryManager sharedManager] requestWithAPI:[NSString stringWithFormat:@"%@/issues", [GHCommon sharedInstance].repositoryModel.repositoryURL]
                                                 params:nil
                                          progressBlock:progressBlock
                                             issueBlock:issueBlock
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
    
    return [GHRepositoryIssuesTableViewCell cellHeightWithStyle:GHRepositoryIssuesCellStyleRow0];
}

- (UITableViewCell *)tableView:(GHBaseTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* CELL_ID = @"";
    
    GHRepositoryIssuesTableViewCell *cell = (GHRepositoryIssuesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    NSInteger index = indexPath.row;
    
    if (cell == nil) {
        cell = [GHRepositoryIssuesTableViewCell cellFromNib:GHRepositoryIssuesCellStyleRow0];
    }
    
    if ([self.dataSourceArray count] > 0) {
        GHIssueModel *model = [self.dataSourceArray objectAtIndex:index];
        [cell setCell:model];
    }
    
    return cell;
}

#pragma mark - GHBaseTab

- (NSString *)titleForTabSectionInRootTabViewController {
    return @"Issues";
}

@end
