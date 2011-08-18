//
//  Category.h
//  BEICClient
//
//  Created by 璐 李 on 11-8-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SubviewTraversal)

- (void)printSubviews;
- (void)printSubviewsWithIndentString:(NSString *)indentString;
- (NSArray *)subviewsMatchingClass:(Class)aClass;
- (NSArray *)subviewsMatchingOrInheritingClass:(Class)aClass;
- (void)populateSubviewsMatchingClass:(Class)aClass inArray:(NSMutableArray *)array exactMatch:(BOOL)exactMatch;

@end
