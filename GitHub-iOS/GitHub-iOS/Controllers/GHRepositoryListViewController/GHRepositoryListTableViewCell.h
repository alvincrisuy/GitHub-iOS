//
//  GHRepositoryListTableViewCell.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GHRepositoryModel;

typedef NS_ENUM(NSInteger, GHRepositoryListCellStyleRow) {
    GHRepositoryListCellStyleRow0 = 0,
};

@interface GHRepositoryListTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *fullName;
@property (nonatomic, retain) IBOutlet UILabel *glazerCount;
@property (nonatomic, retain) IBOutlet UILabel *forkCount;
@property (nonatomic, retain) IBOutlet UILabel *language;
@property (nonatomic, retain) IBOutlet UILabel *desc;

@property (nonatomic, retain) IBOutlet UIImageView *starredImageView;
@property (nonatomic, retain) IBOutlet UIImageView *forkedImageView;

@property (nonatomic, retain) IBOutlet UIButton *button;

+ (instancetype)cellFromNib:(NSInteger)index;
+ (CGFloat)cellHeightWithStyle:(GHRepositoryListCellStyleRow)style;

- (void)setCell:(GHRepositoryModel *)model;

@end
