//
//  GHRepositoryViewController.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 27/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHRepositoryViewController.h"

#import "GHCommon.h"
#import "GHRepositoryIssuesViewController.h"
#import "GHRepositoryContributorsViewController.h"

#import "GHRepositoryModel.h"

#import <ASCIImage/PARImage+ASCIIInput.h>

@interface GHRepositoryViewController ()

@end

@implementation GHRepositoryViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.issuesViewController = [[GHRepositoryIssuesViewController alloc] initWithNibName:NSStringFromClass([GHRepositoryIssuesViewController class]) bundle:nil];
        self.contributorsViewController = [[GHRepositoryContributorsViewController alloc] initWithNibName:NSStringFromClass([GHRepositoryContributorsViewController class]) bundle:nil];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.issuesViewController.model = self.repository;
    self.contributorsViewController.model = self.repository;
    
    [self setViewControllers:self.issuesViewController, self.contributorsViewController, nil];
    
    [self setSelectedTabIndex:0];
    
    [self setInfo];
    
    UIColor *black = [UIColor grayColor];
    
    UIImage* starredImage = [UIImage imageWithASCIIRepresentation:[[GHCommon sharedInstance] asciiStar]
                                                            color:black
                                                  shouldAntialias:NO];
    
    self.starredImageView.image = starredImage;
    
    UIImage* forkedImage = [UIImage imageWithASCIIRepresentation:[[GHCommon sharedInstance] asciiFork]
                                                  contextHandler:^(NSMutableDictionary *context) {
                                                      context[ASCIIContextFillColor]   = [PARColor grayColor];
                                                      context[ASCIIContextShouldClose]     = @(YES);
                                                      context[ASCIIContextShouldAntialias] = @(YES);
                                                  }];
    
    self.forkedImageView.image = forkedImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setInfo {
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setNumberStyle:NSNumberFormatterDecimalStyle];
    [fmt setMaximumFractionDigits:0];
    
    NSString *starGlazerCountString = [fmt stringFromNumber:@(self.repository.repositoryStarGazersCount)];
    NSString *forkCountString = [fmt stringFromNumber:@(self.repository.repositoryForksCount)];
    
    self.fullName.text = self.repository.repositoryFullName;
    self.glazerCount.text = starGlazerCountString;
    self.forkCount.text = forkCountString;
    self.language.text = self.repository.repositoryLanguage;
    self.desc.text = self.repository.repositoryDescription;
}

@end
