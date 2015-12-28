//
//  GHSearchViewController.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 27/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHSearchViewController.h"

#import "GHBaseTableView.h"
#import "GHSearchTableViewCell.h"
#import "GHRootViewController.h"
#import "GHSearchManager.h"

#import "ProgressHUD.h"

#import "GHRepositoryModel.h"

@interface GHSearchViewController () {
    GHSearchManager *apiManager;
}

@end

@implementation GHSearchViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        
        apiManager = [GHSearchManager sharedManager];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissKeyboard {
    
    [self.view endEditing:YES];
}

#pragma mark - GHBaseTableView

- (NSInteger)numberOfSectionsInTableView:(GHBaseTableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(GHBaseTableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(GHBaseTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GHCellStyleRow index = indexPath.row;
    switch (index) {
        case GHCellStyleRow0:
            return [GHSearchTableViewCell cellHeightWithStyle:GHCellStyleRow0];
        case GHCellStyleRow1:
            return [GHSearchTableViewCell cellHeightWithStyle:GHCellStyleRow1];
    }
}

- (UITableViewCell *)tableView:(GHBaseTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* CELL_ID = @"";
    
    GHSearchTableViewCell *cell = (GHSearchTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    GHCellStyleRow index = indexPath.row;
    
    if (cell == nil) {
        switch (index) {
            case GHCellStyleRow0:
                cell = [GHSearchTableViewCell cellFromNib:GHCellStyleRow0];
                break;
            case GHCellStyleRow1:
                cell = [GHSearchTableViewCell cellFromNib:GHCellStyleRow1];
                cell.searchTextField.delegate = self;
                break;
        }
    }
    
    return cell;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self dismissKeyboard];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"stars", @"sort",
                                @"desc", @"order",
                                textField.text, @"q", nil];
    
    RequestProgressBlock progressBlock = ^(NSProgress *progress) {
        
    };
    
    RequestSearchBlock searchBlock = ^(NSArray *list) {
        
        [[GHRootViewController sharedController] transferRepositoryListViewController:self repositories:list];
    };
    
    RequestFailedBlock failedBlock = ^(NSURLSessionDataTask *task, NSError *error) {
        [ProgressHUD dismiss];
    };

    [apiManager requestWithParams:parameters
                    progressBlock:progressBlock
                      searchBlock:searchBlock
                      failedBlock:failedBlock];
    
    return YES;
}

@end
