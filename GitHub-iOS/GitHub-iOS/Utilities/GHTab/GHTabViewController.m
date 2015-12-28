//
//  GHTabViewController.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHTabViewController.h"

#import "GHTabViewDelegate.h"

@implementation GHTabViewController

@synthesize viewControllerArray = mViewControllerArray;
@synthesize tabView = mTabView;
@synthesize selectedIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.viewControllerArray = [NSMutableArray array];
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setSelectedTabIndex:(NSInteger)tabIndex
{
    [self.tabView setSelectionTabIndex:tabIndex];
    [self didTouchUpSectionTabWithTabIndex:tabIndex];
}

- (void)refreshSectionTabView {
    
    NSArray* subViews = [sectionTabView subviews];
    
    for(UIView* view in subViews){
        [view removeFromSuperview];
    }
    
    NSArray* viewArray = [[NSBundle mainBundle] loadNibNamed:@"GHTabView" owner:self options:nil];
    
    GHTabView* tabView = [viewArray objectAtIndex:0];//[viewArray objectAtIndex:
                         // self.viewControllerArray.count-1];
//    tabView.frame = sectionTabView.bounds;
    
    NSMutableArray* titleArray = [NSMutableArray array];
    
    for(UIViewController<GHTabViewDelegate>* viewController in self.viewControllerArray){
        [titleArray addObject:[viewController titleForTabSectionInRootTabViewController]];
    }
    
    [tabView setSectionTabTitles:titleArray viewControllers:self.viewControllerArray];
    
    tabView.delegate = self;
    
    self.tabView = tabView;
    
    [sectionTabView addSubview:tabView];
    
}

- (void)setViewControllers:(UIViewController<GHTabViewDelegate>*)argValues,... {
    
    self.viewControllerArray = [NSMutableArray array];
    
    va_list arguments;
    
    va_start(arguments, argValues);
    
    UIViewController* viewController = argValues;
    
    while(viewController){
        
        [self.viewControllerArray addObject:viewController];
        
        // Next View Controller
        viewController = va_arg(arguments, typeof(UIViewController<GHTabViewDelegate>*));
        
    }
    
    va_end(arguments);
    
    [self refreshSectionTabView];
    
}


#pragma mark - PPTabViewInternalDelegate
- (void)didTouchUpSectionTabWithTabIndex:(NSInteger)index
{
    self.selectedIndex = index;
    
    UIViewController* viewController = [self.viewControllerArray objectAtIndex:index];
    
    viewController.view.frame = contentView.bounds;
    
    NSArray* subViews = [contentView subviews];
    
    if (subViews.count > 0) {
        
        for (UIView* view in subViews) {
            [view removeFromSuperview];
        }
        
        [contentView addSubview:viewController.view];
        
        NSArray *aOSVersions = [[[UIDevice currentDevice]systemVersion] componentsSeparatedByString:@"."];
        NSInteger iOSVersionMajor = [[aOSVersions objectAtIndex:0] intValue];
        
        if(iOSVersionMajor < 5) [viewController viewWillAppear:YES];
        
    } else {
        
        [contentView addSubview:viewController.view];
        
        [viewController viewWillAppear:YES];
        
    }
}

@end