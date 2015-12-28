//
//  GHTabView.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHTabView.h"

@implementation GHTabView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelectionTabIndex:(NSInteger)index {
    for(int i = 0 ; i < 5 ; i++) {
        
        UIButton* button = [self valueForKey:[NSString stringWithFormat:@"sectionTabButton0%d",i+1]];
        
        if(!button) break;
        
        BOOL isSelectIndex = (i == index);
        
        [button setEnabled:!isSelectIndex];
        [button setSelected:!isSelectIndex];
    }
    
}

- (void)setSectionTabTitles:(NSArray*)titles viewControllers:(NSArray*)viewControllers
{
    
    for(int i = 0 ; i < 5 ; i++){
        
        UIButton* button = [self valueForKey:[NSString stringWithFormat:@"sectionTabButton0%d",i+1]];
        
        if(!button) break;
        
        [button setTitle:[titles objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitle:[titles objectAtIndex:i] forState:UIControlStateHighlighted];
        [button setTitle:[titles objectAtIndex:i] forState:UIControlStateSelected];
        [button setTitle:[titles objectAtIndex:i] forState:UIControlStateDisabled];
        
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
        
        [button setExclusiveTouch:YES];
    }
}


- (IBAction)didTouchUpTabButtonAction:(id)sender {
    NSInteger index = [(UIButton*)sender tag];
    
    [self setSelectionTabIndex:index];
    
    if(delegate && [delegate respondsToSelector:@selector(didTouchUpSectionTabWithTabIndex:)]) {
        [delegate didTouchUpSectionTabWithTabIndex:index];
    }
}

@end
