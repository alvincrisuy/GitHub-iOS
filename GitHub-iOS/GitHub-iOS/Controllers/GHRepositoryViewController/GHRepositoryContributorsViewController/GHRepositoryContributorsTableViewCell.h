//
//  GHRepositoryContributorsTableViewCell.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GHContributorModel;

typedef NS_ENUM(NSInteger, GHRepositoryContributorsCellStyleRow) {
    GHRepositoryContributorsCellStyleRow0 = 0,
};

@interface GHRepositoryContributorsTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UIImageView *pictureImageView;
@property (nonatomic, retain) IBOutlet UILabel *login;
@property (nonatomic, retain) IBOutlet UILabel *contributionCount;

+ (instancetype)cellFromNib:(NSInteger)index;
+ (CGFloat)cellHeightWithStyle:(GHRepositoryContributorsCellStyleRow)style;

- (void)setCell:(GHContributorModel *)model;

@end
