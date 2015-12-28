//
//  GHSearchTableViewCell.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHSearchTableViewCell.h"

#define kGHSearchRowHeight0 44.0f
#define kGHSearchRowHeight1 44.0f

@implementation GHSearchTableViewCell

+ (instancetype)cellFromNib:(NSInteger)index {
    NSArray* array;
    array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([GHSearchTableViewCell class])
                                          owner:nil
                                        options:nil];
    
    if (!array || ![array count]) {
        return nil;
    }
    
    GHSearchTableViewCell *cell = [array objectAtIndex:index];
    [cell setBackgroundColor:[UIColor clearColor]];
    
    return cell;
}

+ (CGFloat)cellHeightWithStyle:(GHCellStyleRow)style {
    switch (style) {
        case GHCellStyleRow0:
            return kGHSearchRowHeight0;
        case GHCellStyleRow1:
            return kGHSearchRowHeight1;
    }
}

@end
