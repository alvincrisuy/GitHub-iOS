//
//  GHBaseTableView.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 27/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GHBaseTableViewDelegate.h"
#import "GHBaseTableViewDataSource.h"

@interface GHBaseTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,assign) IBOutlet id<GHBaseTableViewDelegate> baseTableDelegate;
@property (nonatomic,assign) IBOutlet id<GHBaseTableViewDataSource> baseTableDataSource;

@end