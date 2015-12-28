//
//  NSDictionary+NullCheck.m
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import "NSDictionary+NullCheck.h"

@implementation NSDictionary (NullCheck)

- (BOOL)isNotNullForKey:(NSString *)key {
    id object = [self objectForKey:key];
    if (object == nil) {
        return NO;
    }
    
    if ([object isKindOfClass:[NSNull class]] || [self isEmptyArrayForObject:object]) {
        return NO;
    }
    
    return YES;
}

- (BOOL)isEmptyArrayForObject:(id)object {
    BOOL isEmpty = NO;
    if ([object isKindOfClass:[NSArray class]]) {
        isEmpty = [object count] == 0 ? YES : NO;
    }
    return isEmpty;
}

@end