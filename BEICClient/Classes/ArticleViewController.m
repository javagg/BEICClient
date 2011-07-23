//
//  ArticleViewController.m
//  BEICClient
//
//  Created by 李璐 on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ArticleViewController.h"


@implementation ArticleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self != nil) {
        self.title = @"My View Controller";
//        UIImage *image = [UIImage imageNamed:@"home.png"];
//        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"主页" image:image tag:0];
//        self.tabBarItem = item;
//        [item release];   
    }
    return self;
}

@end

