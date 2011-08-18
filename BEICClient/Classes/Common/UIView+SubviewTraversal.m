//
//  Category.m
//  BEICClient
//
//  Created by 璐 李 on 11-8-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "UIView+SubviewTraversal.h"

@implementation UIView (SubviewTraversal)

- (void)printSubviewsWithIndentString:(NSString *)indentString {
    if (indentString == nil) indentString = @"";
    
    NSString *viewDescription = NSStringFromClass([self class]);
    
    printf("%s+-%s\n", [indentString UTF8String], [viewDescription UTF8String]);
    
    if (self.subviews) {
        NSArray *siblings = self.superview.subviews;
        if ([siblings count] > 1 && ([siblings indexOfObject:self] < [siblings count]-1)) {
            indentString = [indentString stringByAppendingString:@"| "];
        } else {
            indentString = [indentString stringByAppendingString:@"  "];
        }
        
        for (UIView *subview in self.subviews) {
            [subview printSubviewsWithIndentString:indentString];
        }
    }
}

- (void)printSubviews {
    [self printSubviewsWithIndentString:nil];
}

- (void)populateSubviewsMatchingClass:(Class)aClass inArray:(NSMutableArray *)array exactMatch:(BOOL)exactMatch {
    if (exactMatch) {
        if ([self isMemberOfClass:aClass]) {
            [array addObject:self];
        }
    } else {
        if ([self isKindOfClass:aClass]) {
            [array addObject:self];
        }        
    }
    
    for (UIView *subview in self.subviews) {
        [subview populateSubviewsMatchingClass:aClass inArray:array exactMatch:exactMatch];
    }
}

- (NSArray *)subviewsMatchingClass:(Class)aClass {
    NSMutableArray *array = [NSMutableArray array];
    [self populateSubviewsMatchingClass:aClass inArray:array exactMatch:YES];
    return array;
}

- (NSArray *)subviewsMatchingOrInheritingClass:(Class)aClass {
    NSMutableArray *array = [NSMutableArray array];
    [self populateSubviewsMatchingClass:aClass inArray:array exactMatch:NO];
    return array;    
}

@end
