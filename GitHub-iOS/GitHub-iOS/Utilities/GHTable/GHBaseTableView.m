//
//  GHBaseTableView.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 27/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHBaseTableView.h"

@implementation GHBaseTableView

- (void)awakeFromNib {
    
    [self setDelegate:self];
    [self setDataSource:self];
    
}

// Display customization

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GHBaseTableView* baseTableView = (GHBaseTableView*)tableView;
    
    if(self.baseTableDelegate && [self.baseTableDelegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]){
        [self.baseTableDelegate tableView:baseTableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
    
}

// Variable height support

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GHBaseTableView* baseTableView = (GHBaseTableView *)tableView;
    
    NSInteger section = [indexPath section];
    NSInteger numberOfRows = 0;
    
    if(self.baseTableDataSource && [self.baseTableDataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        numberOfRows = [self.baseTableDataSource tableView:self numberOfRowsInSection:section];
    }
    
    if(numberOfRows == 0){
        return 0.0f;
    }
    
    CGFloat heightForRow = 0.0f;
    
    if (self.baseTableDelegate && [self.baseTableDelegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]){
        heightForRow = [self.baseTableDelegate tableView:baseTableView heightForRowAtIndexPath:indexPath];
    }
    
    return heightForRow;
    
}

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GHBaseTableView* baseTableView = (GHBaseTableView*)tableView;
    
    NSIndexPath* selectRowIndexPath = nil;
    
    if(self.baseTableDelegate && [self.baseTableDelegate respondsToSelector:@selector(tableView:willSelectRowAtIndexPath:)]){
        selectRowIndexPath =  [self.baseTableDelegate tableView:baseTableView willSelectRowAtIndexPath:indexPath];
    }
    
    return selectRowIndexPath;
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GHBaseTableView* baseTableView = (GHBaseTableView*)tableView;
    
    if(self.baseTableDelegate && [self.baseTableDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]){
        [self.baseTableDelegate tableView:baseTableView didSelectRowAtIndexPath:indexPath];
    }else{
        [baseTableView setAllowsSelection:NO];
    }
    
}

#pragma mark - UITableView DataSource Method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    GHBaseTableView* baseTableView = (GHBaseTableView*)tableView;
    
    // for Empty
    NSInteger numberOfRows = 0;
    
    if (self.baseTableDataSource && [self.baseTableDataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        numberOfRows = [self.baseTableDataSource tableView:baseTableView numberOfRowsInSection:section];
    }
    
//    if(numberOfRows == 0) {
//        if ([self.baseTableDelegate noSearchResult:baseTableView]) {
//            numberOfRows = 1;
//        }
//    }
    
    return numberOfRows;
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GHBaseTableView* baseTableView = (GHBaseTableView*)tableView;
    
    UITableViewCell* cell = nil;
    
    NSInteger index = [indexPath row];
    
    NSInteger section = [indexPath section];
    
    NSInteger numberOfRows = 0;
    
    if (self.baseTableDataSource && [self.baseTableDataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        numberOfRows = [self.baseTableDataSource tableView:self numberOfRowsInSection:section];
    }
    
    if (numberOfRows == 0 && index == 0) {
        
        // set a default empty cell
    }
    
    if (self.baseTableDataSource && [self.baseTableDataSource respondsToSelector:@selector(tableView:cellForRowAtIndexPath:)]) {
        cell = [self.baseTableDataSource tableView:baseTableView cellForRowAtIndexPath:indexPath];
    }
    
    return cell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Default is 1 if not implemented
    
    GHBaseTableView* baseTableView = (GHBaseTableView*)tableView;
    
    NSInteger numberOfSections = 1;
    
    if(self.baseTableDataSource && [self.baseTableDataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]){
        numberOfSections = [self.baseTableDataSource numberOfSectionsInTableView:baseTableView];
    }
    
    return numberOfSections;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    // fixed font style. use custom view (UILabel) if you want something different
    
    GHBaseTableView* baseTableView = (GHBaseTableView*)tableView;
    
    NSString* titleForHeader = nil;
    
    if(self.baseTableDataSource && [self.baseTableDataSource respondsToSelector:@selector(tableView:titleForHeaderInSection:)]){
        titleForHeader = [self.baseTableDataSource tableView:baseTableView titleForHeaderInSection:section];
    }
    
    return titleForHeader;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    GHBaseTableView* baseTableView = (GHBaseTableView *)tableView;
    
    NSString* titleForFooter = nil;
    
    if(self.baseTableDataSource && [self.baseTableDataSource respondsToSelector:@selector(tableView:titleForFooterInSection:)]){
        titleForFooter = [self.baseTableDataSource tableView:baseTableView titleForFooterInSection:section];
    }
    
    return titleForFooter;
    
}

@end