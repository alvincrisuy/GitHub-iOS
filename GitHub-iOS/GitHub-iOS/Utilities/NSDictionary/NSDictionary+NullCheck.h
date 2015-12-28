//
//  NSDictionary+NullCheck.h
//  GitHub-iOS
//
//  Created by Alvin Cris Uy on 28/12/2015.
//  Copyright © 2015 Alvin Cris Uy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SetBoolValueIfNotNullForKey(InsertProp, Dic, Key)    \
if([(Dic) respondsToSelector:NSSelectorFromString(@"isNotNullForKey:")]) {  \
if([(Dic) isNotNullForKey:(Key)]) {  \
(InsertProp) = [[(Dic) objectForKey:(Key)] boolValue];  \
} \
} \

#define SetIntValueIfNotNullForKey(InsertProp, Dic, Key)    \
if([(Dic) respondsToSelector:NSSelectorFromString(@"isNotNullForKey:")]) {  \
if([(Dic) isNotNullForKey:(Key)]) {  \
(InsertProp) = [[(Dic) objectForKey:(Key)] intValue];  \
} \
} \

#define SetFloatValueIfNotNullForKey(InsertProp, Dic, Key)    \
if([(Dic) respondsToSelector:NSSelectorFromString(@"isNotNullForKey:")]) {  \
if([(Dic) isNotNullForKey:(Key)]) {  \
(InsertProp) = [[(Dic) objectForKey:(Key)] floatValue];  \
} \
} \

#define SetDoubleValueIfNotNullForKey(InsertProp, Dic, Key)    \
if([(Dic) respondsToSelector:NSSelectorFromString(@"isNotNullForKey:")]) {  \
if([(Dic) isNotNullForKey:(Key)]) {  \
(InsertProp) = [[(Dic) objectForKey:(Key)] doubleValue];  \
} \
} \

#define SetLongLongIntValueIfNotNullForKey(InsertProp, Dic, Key)    \
if([(Dic) respondsToSelector:NSSelectorFromString(@"isNotNullForKey:")]) {  \
if([(Dic) isNotNullForKey:(Key)]) {  \
(InsertProp) = [[(Dic) objectForKey:(Key)] longLongValue];  \
} \
} \

#define SetValueIfNotNullForKey(InsertProp, Dic, Key)    \
if([(Dic) respondsToSelector:NSSelectorFromString(@"isNotNullForKey:")]) {  \
if([(Dic) isNotNullForKey:(Key)]) { \
(InsertProp) = [(Dic) objectForKey:(Key)];  \
} \
} \

@interface NSDictionary (NullCheck)

- (BOOL)isNotNullForKey:(NSString *)key;

@end
