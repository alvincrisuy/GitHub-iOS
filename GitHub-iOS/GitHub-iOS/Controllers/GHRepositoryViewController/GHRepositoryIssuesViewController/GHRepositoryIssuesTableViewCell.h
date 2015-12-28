//
//  GHRepositoryIssuesTableViewCell.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GHIssueModel;

typedef NS_ENUM(NSInteger, GHRepositoryIssuesCellStyleRow) {
    GHRepositoryIssuesCellStyleRow0 = 0,
};

@interface GHRepositoryIssuesTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *number;
@property (nonatomic, retain) IBOutlet UILabel *title;
@property (nonatomic, retain) IBOutlet UILabel *desc;

+ (instancetype)cellFromNib:(NSInteger)index;
+ (CGFloat)cellHeightWithStyle:(GHRepositoryIssuesCellStyleRow)style;

- (void)setCell:(GHIssueModel *)model;

@end
