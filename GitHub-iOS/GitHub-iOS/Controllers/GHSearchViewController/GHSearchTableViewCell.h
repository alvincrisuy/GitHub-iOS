//
//  GHSearchTableViewCell.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GHCellStyleRow) {
    GHCellStyleRow0 = 0,
    GHCellStyleRow1 = 1,
};

@interface GHSearchTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UITextField *searchTextField;

+ (instancetype)cellFromNib:(NSInteger)index;
+ (CGFloat)cellHeightWithStyle:(GHCellStyleRow)style;

@end