//
//  FirstViewController.m
//  BEICClient
//
//  Created by 李璐 on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "NewsSectionCell.h"

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self != nil) {
        self.title = @"My View Controller";
        UIImage *image = [UIImage imageNamed:@"home.png"];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 40.0f)];
        [imageView setImage:[UIImage imageNamed:@"logo.png"]];
        self.navigationItem.titleView = imageView;
        [imageView release];
        
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"主页" image:image tag:0];
        self.tabBarItem = item;
        [item release];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [super dealloc];
}

#pragma mark TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 256;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    NewsSectionCell *cell = (NewsSectionCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray *xibs = [[NSBundle mainBundle] loadNibNamed:@"NewsSectionCell" owner:self options:nil];
        cell = [xibs objectAtIndex:0];
    }
    [cell updateMe];
  
    return cell;
}

- (NSInteger)tableView:(UITableView *)atableView numberOfRowsInSection:(NSInteger)section {
	return 2;
}

@end
