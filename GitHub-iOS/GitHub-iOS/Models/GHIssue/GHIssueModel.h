//
//  GHIssueModel.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHIssueModel : NSObject

@property (nonatomic, assign) NSInteger issueId;
@property (nonatomic, retain) NSString *issueTitle;
@property (nonatomic, retain) NSString *issueBody;
@property (nonatomic, assign) NSInteger issueCommentCount;
@property (nonatomic, assign) NSInteger issueNumber;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
