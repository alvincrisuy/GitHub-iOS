//
//  GHRepositoryContributorsTableViewCell.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHRepositoryContributorsTableViewCell.h"
#import "GHContributorModel.h"

#import <AFNetworking/UIImageView+AFNetworking.h>

#define kGHRepositoryContributorRowHeight0 60.0f

@implementation GHRepositoryContributorsTableViewCell

+ (instancetype)cellFromNib:(NSInteger)index {
    NSArray* array;
    array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([GHRepositoryContributorsTableViewCell class])
                                          owner:nil
                                        options:nil];
    
    if (!array || ![array count]) {
        return nil;
    }
    
    GHRepositoryContributorsTableViewCell *cell = [array objectAtIndex:index];
    [cell setBackgroundColor:[UIColor clearColor]];
    
    return cell;
}

+ (CGFloat)cellHeightWithStyle:(GHRepositoryContributorsCellStyleRow)style {
    switch (style) {
        case GHRepositoryContributorsCellStyleRow0:
            return kGHRepositoryContributorRowHeight0;
    }
}

- (void)setCell:(GHContributorModel *)model {
    
    NSURL *url = [NSURL URLWithString:model.contributorAvatarURL];
    
    [self.pictureImageView setImageWithURL:url];
    
    self.login.text = model.contributorLogin;
    self.contributionCount.text = [NSString stringWithFormat:@"%d", model.contributorContributionsCount];
}

@end
