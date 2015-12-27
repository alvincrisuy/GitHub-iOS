//
//  GHAppDelegate.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 27/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GHRootViewController;

@interface GHAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow     *window;
@property (nonatomic, retain) GHRootViewController  *rootViewController;

@end

