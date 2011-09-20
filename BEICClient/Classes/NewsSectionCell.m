//
//  NewsSectionCell.m
//  BEICClient
//
//  Created by 璐 李 on 11-9-15.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "NewsSectionCell.h"
#import "NewsThumbView.h"

@implementation NewsSectionCell

@synthesize titleLabel, scrollView, pageControl;
@synthesize content;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil) {
        scrollView.delegate = self;
        scrollView.pagingEnabled = true;
    }
    return self;
}

- (void)dealloc {
    self.titleLabel = nil;
    self.scrollView = nil;
    self.pageControl = nil;
    self.content = nil;
    [super dealloc];
}

- (void)updateMe {
    scrollView.delegate = self;
    scrollView.pagingEnabled = true;
    scrollView.directionalLockEnabled = true;
    
    CGRect frame = self.scrollView.frame;
    [self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    NewsThumbView *thumbView1 = [[NewsThumbView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width/2,frame.size.height)];
    NewsThumbView *thumbView2 = [[NewsThumbView alloc] initWithFrame:CGRectMake(frame.size.width/2, 0, frame.size.width/2,frame.size.height)];
    NewsThumbView *thumbView3 = [[NewsThumbView alloc] initWithFrame:CGRectMake(2*(frame.size.width/2), 0, frame.size.width/2,frame.size.height)];
    NewsThumbView *thumbView4 = [[NewsThumbView alloc] initWithFrame:CGRectMake(3*(frame.size.width/2), 0, frame.size.width/2,frame.size.height)];

    [self.scrollView addSubview: thumbView1];
    [self.scrollView addSubview: thumbView2];
      [self.scrollView addSubview: thumbView3];
       [self.scrollView addSubview: thumbView4];
    [thumbView1 release];
    [thumbView2 release];
    [thumbView3 release];
    [thumbView4 release];
    self.scrollView.showsHorizontalScrollIndicator = true;
    int j = 2;

    self.scrollView.contentSize = CGSizeMake(frame.size.width * j, frame.size.height);
    self.pageControl.numberOfPages = j; 
}

- (void)changePage:(id)sender {
    int pageIndex = pageControl.currentPage;
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * pageIndex;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}

#pragma mark UIScrolViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = self.scrollView.contentOffset.x / (self.scrollView.frame.size.width);
}

@end
