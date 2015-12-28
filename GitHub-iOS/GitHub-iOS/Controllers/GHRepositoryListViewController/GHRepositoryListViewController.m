//
//  GHRepositoryListViewController.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 27/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHRepositoryListViewController.h"

#import "GHCommon.h"
#import "GHBaseTableView.h"
#import "GHRepositoryListTableViewCell.h"
#import "GHRepositoryModel.h"
#import "GHRootViewController.h"

@interface GHRepositoryListViewController ()

@end

@implementation GHRepositoryListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GHBaseTableView

- (NSInteger)numberOfSectionsInTableView:(GHBaseTableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(GHBaseTableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.repositories.count;
}

- (CGFloat)tableView:(GHBaseTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [GHRepositoryListTableViewCell cellHeightWithStyle:GHRepositoryListCellStyleRow0];
}

- (UITableViewCell *)tableView:(GHBaseTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* CELL_ID = @"RepositoryList";
    
    GHRepositoryListTableViewCell *cell = (GHRepositoryListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    NSInteger index = indexPath.row;
    
    if (cell == nil) {
        cell = [GHRepositoryListTableViewCell cellFromNib:GHRepositoryListCellStyleRow0];
    }
    
    GHRepositoryModel *model = [self.repositories objectAtIndex:index];
    [cell setCell:model];
    
    [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.button.tag = index;
    
    return cell;
}

- (void)buttonAction:(UIButton*)btn {
    GHRepositoryModel *model = [self.repositories objectAtIndex:btn.tag];
    
    [GHCommon sharedInstance].repositoryModel = model;
    
    [[GHRootViewController sharedController] transferRepositoryViewController:self model:model];
}

@end
