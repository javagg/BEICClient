//
//  NSUserDefaults+Additions.m
//  BEICClient
//
//  Created by 璐 李 on 11-8-13.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "NSUserDefaults+Additions.h"

@implementation NSUserDefaults (Additions)

- (BOOL)isCachingEnabled {
    return [self boolForKey:DefaultsKeyCaching];
}

- (BOOL)isAutoLoginEnabled {
    return [self boolForKey:DefaultsKeyAutoLogin];
}

- (NSString *)username {
    return [self stringForKey:DefaultsKeyUsername];
}

- (void)setUsername:(NSString *)username {
    [self setObject:username forKey:DefaultsKeyUsername];
}

@end
