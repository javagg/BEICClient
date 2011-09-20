//
//  NewsThumbView.h
//  BEICClient
//
//  Created by 璐 李 on 11-9-15.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface NewsThumbView : UIView {
    
}

@property (nonatomic, retain) NSAttributedString* attributedString;
@property (nonatomic, retain) NSMutableArray *frames;
@property (nonatomic, retain) NSArray *images;

//- (void)buildFrames;
//-(void)setAttString:(NSAttributedString *)attString withImages:(NSArray*)imgs;
//-(void)drawImagesInFrame:(CTFrameRef)f inContext:(CGContextRef)context withRect:(CGRect)rect;
@end
