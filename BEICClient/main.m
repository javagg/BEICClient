//
//  main.m
//  BEICClient
//
//  Created by 李璐 on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int ret = UIApplicationMain(argc, argv, nil, @"BEICClientAppDelegate");
    [pool drain];
    return ret;
}
