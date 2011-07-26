//
//  WebBrowserController.m
//  BEICClient
//
//  Created by 璐 李 on 11-7-26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "WebBrowserController.h"

@implementation WebBrowserController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self != nil) {
        self.title = @"主页";
        UIImage *image = [UIImage imageNamed:@"website.png"];
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"主页" image:image tag:0];
        self.tabBarItem = item;
        [item release];   
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [[[NSURL alloc] initWithString:@"http://www.xjtu.edu.cn"] autorelease];
    [self openURL:url];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

@end
