//
//  GHTabViewController.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GHTabView.h"
#import "GHTabViewDelegate.h"
#import "GHTabViewInternalDelegate.h"

@interface GHTabViewController : UIViewController<GHTabViewInternalDelegate> {
    IBOutlet UIView* sectionTabView;
    IBOutlet UIView* contentView;
}

@property(nonatomic, retain) GHTabView* tabView;
@property(nonatomic, retain) NSMutableArray* viewControllerArray;
@property(nonatomic, assign) NSInteger selectedIndex;

- (void)setViewControllers:(UIViewController<GHTabViewDelegate>*)argValues,...NS_REQUIRES_NIL_TERMINATION;
- (void)setSelectedTabIndex:(NSInteger)tabIndex;
@end
