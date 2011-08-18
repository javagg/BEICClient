//
//  UIApplication+NetworkActivity.m
//  BEICClient
//
//  Created by 璐 李 on 11-8-13.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "UIApplication+NetworkActivity.h"

static NSInteger networkActivityCount = 0;

@implementation UIApplication (NetworkActivity)

- (void)refreshNetworkActivityIndicator {
    if (![NSThread isMainThread]) {
        [self performSelectorOnMainThread:@selector(refreshNetworkActivityIndicator) withObject:nil waitUntilDone:NO];
        return;
    }
    self.networkActivityIndicatorVisible = (self.networkActivityCount > 0);
}

- (NSInteger)networkActivityCount {
    @synchronized(self) {
        return networkActivityCount;        
    }
}

- (void)pushNetworkActivity {
    @synchronized(self) {
        networkActivityCount++;
    }
    [self refreshNetworkActivityIndicator];
}

- (void)popNetworkActivity {
    @synchronized(self) {
        if (networkActivityCount > 0) {
            networkActivityCount--;
        } else {
            networkActivityCount = 0;
            NSLog(@"%s Unbalanced network activity: count already 0.",
                  __PRETTY_FUNCTION__);
        }        
    }
    [self refreshNetworkActivityIndicator];
}

- (void)resetNetworkActivity {
    @synchronized(self) {
        networkActivityCount = 0;
    }
    [self refreshNetworkActivityIndicator];        
}

@end
