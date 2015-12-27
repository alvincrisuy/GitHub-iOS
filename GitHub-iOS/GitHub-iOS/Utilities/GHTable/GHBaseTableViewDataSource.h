//
//  GHBaseTableViewDataSource.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 27/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//


@class GHBaseTableView;

@protocol GHBaseTableViewDataSource <NSObject>

@required

- (NSInteger)tableView:(GHBaseTableView *)tableView numberOfRowsInSection:(NSInteger)section;

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(GHBaseTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (NSInteger)numberOfSectionsInTableView:(GHBaseTableView *)tableView;              // Default is 1 if not implemented

- (NSString *)tableView:(GHBaseTableView *)tableView titleForHeaderInSection:(NSInteger)section;    // fixed font style. use custom view (UILabel) if you want something different
- (NSString *)tableView:(GHBaseTableView *)tableView titleForFooterInSection:(NSInteger)section;
- (NSString *)tableView:(GHBaseTableView *)tableView titleForEmptyCellInSection:(NSInteger)section;

@end