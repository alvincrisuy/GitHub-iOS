//
//  GHRepositoryIssuesTableViewCell.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHRepositoryIssuesTableViewCell.h"
#import "GHIssueModel.h"

#define kGHRepositoryIssueRowHeight0 70.0f

@implementation GHRepositoryIssuesTableViewCell

+ (instancetype)cellFromNib:(NSInteger)index {
    NSArray* array;
    array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([GHRepositoryIssuesTableViewCell class])
                                          owner:nil
                                        options:nil];
    
    if (!array || ![array count]) {
        return nil;
    }
    
    GHRepositoryIssuesTableViewCell *cell = [array objectAtIndex:index];
    [cell setBackgroundColor:[UIColor clearColor]];
    
    return cell;
}

+ (CGFloat)cellHeightWithStyle:(GHRepositoryIssuesCellStyleRow)style {
    switch (style) {
        case GHRepositoryIssuesCellStyleRow0:
            return kGHRepositoryIssueRowHeight0;
    }
}

- (void)setCell:(GHIssueModel *)model {
    self.number.text    = [NSString stringWithFormat:@"%d", model.issueNumber];
    self.title.text     = model.issueTitle;
    self.desc.text      = model.issueBody;
}

@end
