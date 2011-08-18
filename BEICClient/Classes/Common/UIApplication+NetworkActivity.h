//
//  UIApplication+NetworkActivity.h
//  BEICClient
//
//  Created by 璐 李 on 11-8-13.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (NetworkActivity)

@property (nonatomic, assign, readonly) NSInteger networkActivityCount;

- (void)pushNetworkActivity;
- (void)popNetworkActivity;
- (void)resetNetworkActivity;

@end
