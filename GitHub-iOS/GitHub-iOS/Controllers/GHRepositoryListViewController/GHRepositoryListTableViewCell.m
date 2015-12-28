//
//  GHRepositoryListTableViewCell.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHRepositoryListTableViewCell.h"
#import "GHRepositoryModel.h"
#import "GHCommon.h"

#import <ASCIImage/PARImage+ASCIIInput.h>

#define kGHRepositoryListRowHeight0 130.0f

@implementation GHRepositoryListTableViewCell

+ (instancetype)cellFromNib:(NSInteger)index {
    NSArray* array;
    array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([GHRepositoryListTableViewCell class])
                                          owner:nil
                                        options:nil];
    
    if (!array || ![array count]) {
        return nil;
    }
    
    GHRepositoryListTableViewCell *cell = [array objectAtIndex:index];
    [cell setBackgroundColor:[UIColor clearColor]];
    
    UIColor *black = [UIColor grayColor];
    
    UIImage* starredImage = [UIImage imageWithASCIIRepresentation:[[GHCommon sharedInstance] asciiStar]
                                                               color:black
                                                     shouldAntialias:NO];
    
    cell.starredImageView.image = starredImage;
    
    UIImage* forkedImage = [UIImage imageWithASCIIRepresentation:[[GHCommon sharedInstance] asciiFork]
                                                  contextHandler:^(NSMutableDictionary *context) {
            context[ASCIIContextFillColor]   = [PARColor grayColor];
        context[ASCIIContextShouldClose]     = @(YES);
        context[ASCIIContextShouldAntialias] = @(YES);
    }];
    
    cell.forkedImageView.image = forkedImage;
    
    return cell;
}

+ (CGFloat)cellHeightWithStyle:(GHRepositoryListCellStyleRow)style {
    switch (style) {
        case GHRepositoryListCellStyleRow0:
            return kGHRepositoryListRowHeight0;
    }
}

- (void)setCell:(GHRepositoryModel *)model {
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setNumberStyle:NSNumberFormatterDecimalStyle];
    [fmt setMaximumFractionDigits:0];
    
    NSString *starGlazerCountString = [fmt stringFromNumber:@(model.repositoryStarGazersCount)];
    NSString *forkCountString = [fmt stringFromNumber:@(model.repositoryForksCount)];
    
    self.fullName.text = model.repositoryFullName;
    self.glazerCount.text = starGlazerCountString;
    self.forkCount.text = forkCountString;
    self.language.text = model.repositoryLanguage;
    self.desc.text = model.repositoryDescription;
}

@end
