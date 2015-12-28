//
//  GHTabView.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GHTabViewInternalDelegate.h"

@interface GHTabView : UIView
{
    IBOutlet UIButton* sectionTabButton01;
    IBOutlet UIButton* sectionTabButton02;
    IBOutlet UIButton* sectionTabButton03;
    IBOutlet UIButton* sectionTabButton04;
    IBOutlet UIButton* sectionTabButton05;
}

@property(nonatomic, assign) id<GHTabViewInternalDelegate> delegate;

- (void)setSelectionTabIndex:(NSInteger)index;
- (void)setSectionTabTitles:(NSArray*)titles viewControllers:(NSArray*)viewControllers;
- (IBAction)didTouchUpTabButtonAction:(id)sender;

@end