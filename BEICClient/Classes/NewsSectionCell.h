//
//  NewsSectionCell.h
//  BEICClient
//
//  Created by 璐 李 on 11-9-15.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

enum NewsSectionStyle {
	NewsSectionStyleDefault,
	NewsSectionStyleText,
    NewsSectionStyleList
};


@interface NewsSectionCell : UITableViewCell <UIScrollViewDelegate>{
    IBOutlet UILabel *titleLabel;
//    NSMutableArray *itemViews;
}

@property (nonatomic, retain) UILabel *titleLabel;		
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;

@property (nonatomic, retain) NSDictionary *content;

- (void)updateMe;
@end
