//
//  GHBaseTableViewDelegate.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 27/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

@class GHBaseTableView;

@protocol GHBaseTableViewDelegate <NSObject>

@required
- (BOOL)noSearchResult:(GHBaseTableView *)tableView;
@optional

// Display customization

- (void)tableView:(GHBaseTableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

// Variable height support
@required
- (CGFloat)tableView:(GHBaseTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
@optional
- (CGFloat)tableView:(GHBaseTableView *)tableView heightForHeaderInSection:(NSInteger)section;
- (CGFloat)tableView:(GHBaseTableView *)tableView heightForFooterInSection:(NSInteger)section;

// Section header & footer information. Views are preferred over title should you decide to provide both

- (UIView *)tableView:(GHBaseTableView *)tableView viewForHeaderInSection:(NSInteger)section;   // custom view for header. will be adjusted to default or specified header height
- (UIView *)tableView:(GHBaseTableView *)tableView viewForFooterInSection:(NSInteger)section;   // custom view for footer. will be adjusted to default or specified footer height

// Selection

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (NSIndexPath *)tableView:(GHBaseTableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
// Called after the user changes the selection.
- (void)tableView:(GHBaseTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

// FooterView in TableView
- (void)didTouchUpFooterViewButton:(UIButton*)sender;
- (UITableViewCell *)viewForFooterInTableView:(GHBaseTableView *)tableView;
- (CGFloat)heightForFooterInTableView:(GHBaseTableView *)tableView;

@end