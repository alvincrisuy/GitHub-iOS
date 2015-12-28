//
//  GHRootViewController.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 27/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GHSearchViewController;
@class GHRepositoryViewController;
@class GHRepositoryListViewController;

@class GHRepositoryModel;

@interface GHRootViewController : UIViewController

// Rootview UIViews
@property (nonatomic, retain) IBOutlet UIView *navigationView;
@property (nonatomic, retain) IBOutlet UIView *contentView;

// Navigation Controller - Navigate Pages
@property (nonatomic, retain) UINavigationController *contentNavigationController;

// Back Button
@property (nonatomic, retain) IBOutlet UIView *backButtonView;
@property (nonatomic, retain) IBOutlet UIButton *backButton;

// Transitions
- (void)transitionSearch;
- (void)transitionRepositoryList;
- (void)transitionRepository;

- (void)transition:(UIViewController *)viewController animated:(BOOL)animated;
- (void)popTransitionAnimated:(BOOL)animated;
- (void)pushTransition:(UIViewController *)viewController animated:(BOOL)animated;

// Transfer
- (void)transferSearchViewController:(id)sender;
- (void)transferRepositoryListViewController:(id)sender repositories:(NSArray *)repositories;
- (void)transferRepositoryViewController:(id)sender model:(GHRepositoryModel *)model;

- (GHSearchViewController *)searchViewController;
- (GHRepositoryListViewController *)repositoryListViewController;
- (GHRepositoryViewController *)repositoryViewController;

// Singleton
+ (GHRootViewController *)sharedController;

@end
