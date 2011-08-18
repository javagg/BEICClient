//
//  NSUserDefaults+Additions.h
//  BEICClient
//
//  Created by 璐 李 on 11-8-13.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *const DefaultsKeyUsername = @"username";
NSString *const DefaultsKeyCaching = @"cachingEnabled";
NSString *const DefaultsKeyAutoLogin = @"autoLogin";

@interface NSUserDefaults (Additions)

@property (nonatomic, assign, getter=isAutoLoginEnabled) BOOL autoLoginEnabled;
@property (nonatomic, assign, getter=isCachingEnabled) BOOL cachingEnabled;
@property (nonatomic, assign) NSString *username;

@end
