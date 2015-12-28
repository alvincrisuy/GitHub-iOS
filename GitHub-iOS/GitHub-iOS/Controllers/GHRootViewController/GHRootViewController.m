//
//  GHRootViewController.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 27/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHRootViewController.h"

#import "GHSearchViewController.h"
#import "GHRepositoryListViewController.h"
#import "GHRepositoryViewController.h"

#import <ASCIImage/PARImage+ASCIIInput.h>

static GHRootViewController* _sharedController = nil;

@interface GHRootViewController () {
    GHSearchViewController          *_searchViewController;
    GHRepositoryListViewController  *_repositoryListViewController;
    GHRepositoryViewController      *_repositoryViewController;
}

// Transition
- (void)hiddenAllPage;

// Back Button
- (IBAction)backButtonAction:(id)sender;

@end

@implementation GHRootViewController

+ (GHRootViewController *)sharedController {
    
    @synchronized(self) {
        if (_sharedController == nil) {
            _sharedController = [[self alloc] init];
        }
    }
    
    return _sharedController;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    
    _sharedController = self;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"Size: %f %f %f %f",
          self.view.frame.size.width,
          self.view.frame.size.height,
          self.view.frame.origin.x,
          self.view.frame.origin.y);
    
    NSLog(@"Bounds: %f %f %f %f",
          self.view.bounds.size.width,
          self.view.bounds.size.height,
          self.view.bounds.origin.x,
          self.view.bounds.origin.y);
    
    // Initialize Back Button
    [self.navigationView addSubview:self.backButtonView];
    [self.backButtonView setAlpha:0.0f];
    
    NSArray *asciiBackButtonRep = @[
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . 1 . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . 6 . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . 2 . . . 5 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . 4 . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . 3 . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",
                                    @". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .",

    ];
    
    UIColor *lightBlue = [UIColor colorWithRed:0.0f green:122.0f/255.0f blue:1.0f alpha:1.0f];
    
    UIImage* backButtonImage = [UIImage imageWithASCIIRepresentation:asciiBackButtonRep
                                                         scaleFactor:1.0f
                                                               color:lightBlue
                                                     shouldAntialias:NO];
    [self.backButton setImage:backButtonImage forState:UIControlStateNormal];
    
    // transition
    [self transitionSearch];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Back Button

- (IBAction)backButtonAction:(id)sender {
    [self popTransitionAnimated:YES];
}

#pragma mark - Transition

- (void)transitionSearch {
    [self hiddenAllPage];
    
    [self transition:self.searchViewController animated:NO];
}

- (void)transitionRepositoryList {
    [self hiddenAllPage];
    
    [self transition:self.repositoryListViewController animated:NO];
}

- (void)transitionRepository {
    [self hiddenAllPage];
    
    [self transition:self.repositoryViewController animated:NO];
}

- (void)hiddenAllPage {
    if (self.contentNavigationController) {
        [self.contentNavigationController popToRootViewControllerAnimated:NO];
    }
    
    NSArray* views = [self.contentView subviews];
    for (UIView* view in views) {
        [view removeFromSuperview];
    }
}

- (void)transition:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.contentNavigationController != nil) {
        self.contentNavigationController = nil;
    }
    
    self.contentNavigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [self.contentNavigationController.view setFrame:self.contentView.bounds];
    
    self.backButtonView.alpha = 0;
    
    viewController.view.alpha = 1;
    
    CATransition* animation;
    animation      = [CATransition animation];
    animation.type = kCATransitionFade;
    {
        [self.contentView addSubview:self.contentNavigationController.view];
    }
    
    if (animated) {
        [self.contentView.layer addAnimation:animation forKey:nil];
    }
    
    [self.contentNavigationController setNavigationBarHidden:YES animated:NO];
    [self.contentNavigationController viewDidAppear:YES];
}

- (void)pushTransition:(UIViewController *)viewController animated:(BOOL)animated {
    CATransition* animation;
    animation      = [CATransition animation];
    animation.type = kCATransitionFade;
    {
        self.backButtonView.alpha = 1;
    }
    
    if (animated) {
        [self.backButtonView.layer addAnimation:animation forKey:nil];
    }
    
    viewController.view.frame = self.contentView.bounds;
    
    [self.contentNavigationController pushViewController:viewController animated:animated];
}

- (void)popTransitionAnimated:(BOOL)animated {
    [self.contentNavigationController popViewControllerAnimated:animated];
    
    if ([[self.contentNavigationController viewControllers] count] == 1) {
        CATransition* animation;
        animation      = [CATransition animation];
        animation.type = kCATransitionFade;
        {
            self.backButtonView.alpha = 0;
        }
        
        if (animated) {
            [self.backButtonView.layer addAnimation:animation forKey:nil];
        }
    }
}

#pragma mark - Transfer

- (void)transferSearchViewController:(id)sender {
    [self pushTransition:[self searchViewController] animated:YES];
}

- (void)transferRepositoryListViewController:(id)sender {
    [self pushTransition:[self repositoryListViewController] animated:YES];
}

- (void)transferRepositoryViewController:(id)sender {
    [self pushTransition:[self repositoryViewController] animated:YES];
}

- (GHSearchViewController *)searchViewController {
    if (!_searchViewController) {
        _searchViewController = [[GHSearchViewController alloc] init];
        _searchViewController.view.frame = self.contentView.bounds;
    }
    
    return _searchViewController;
}

- (GHRepositoryListViewController *)repositoryListViewController {
    if (!_repositoryListViewController) {
        _repositoryListViewController = [[GHRepositoryListViewController alloc] init];
        _repositoryListViewController.view.frame = self.contentView.bounds;
    }
    
    return _repositoryListViewController;
}

- (GHRepositoryViewController *)repositoryViewController {
    if (!_repositoryViewController) {
        _repositoryViewController = [[GHRepositoryViewController alloc] init];
        _repositoryViewController.view.frame = self.contentView.bounds;
    }
    
    return _repositoryViewController;
}

@end
