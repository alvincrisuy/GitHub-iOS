//
//  GHBaseTableViewController.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 27/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "GHBaseTableViewController.h"

#define kDefaultBackgroundColor [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0f]

@implementation GHBaseTableViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [self.view setBackgroundColor:kDefaultBackgroundColor];
        
    }
    return self;
}

@end