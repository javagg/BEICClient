//
//  NewsThumbView.m
//  BEICClient
//
//  Created by 璐 李 on 11-9-15.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "NewsThumbView.h"


@implementation NewsThumbView

@synthesize attributedString, frames, images;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        self.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *gestureRecogniser = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        gestureRecogniser.numberOfTapsRequired = 1;
        [self addGestureRecognizer:gestureRecogniser];
        [gestureRecogniser release];
    }
    return self;
}

- (void)handleTap:(UIGestureRecognizer*)tap {
    NSLog(@"I've been tapped!.");
}

- (void)awakeFromNib {
	[super awakeFromNib];
}

-(void)dealloc {
    self.attributedString = nil;
    self.frames = nil;
    self.images = nil;
    [super dealloc];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    //创建要输出的字符串
    NSString *longText = @"\t记得刚新婚的时候，早晨时必定会在他怀抱中醒来，我总是红着脸不敢说一声早，怕嘴里的口气弄皱了他的眉；漱口杯与牙刷坚持要和他用同款不同色，摆在一起看才有夫妻的感觉；我会帮他打点上班的衣物，什么衬衫配什么领带，经过我的审美才准他穿上身。记得刚新婚的时候，早晨时必定会在他怀抱中醒来，我总是红着脸不敢说一声早，\n\t怕嘴里的口气弄皱了他的眉；漱口杯与牙刷坚持要和他用同款不同色，摆在一起看才有夫妻的感觉；我会帮他打点上班的衣物，什么衬衫配什么领带，经过我的审美才准他穿上身。记得刚新婚的时候，早晨时必定会在他怀抱中醒来，我总是红着脸不敢说一声早，怕嘴里的口气弄皱了他的眉；漱口杯与牙刷坚持要和他用同款不同色，摆在一起看才有夫妻的感觉；我会帮他打点上班的衣物，什么衬衫配什么领带，经过我的审美才准他穿上身。"; /* … */
    

    //创建AttributeString
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:longText];
    
    //创建字体以及字体大小
    CTFontRef helvetica = CTFontCreateWithName(CFSTR("Helvetica"), 14.0, NULL);
    CTFontRef helveticaBold = CTFontCreateWithName(CFSTR("Helvetica-Bold"), 14.0, NULL);
    
    //添加字体 目标字符串从下标0开始到字符串结尾
    [string addAttribute:(id)kCTFontAttributeName
                   value:(id)helvetica
                   range:NSMakeRange(0, [string length])];
    
//    //添加字体 目标字符串从下标0开始，截止到4个单位的长度
//    [string addAttribute:(id)kCTFontAttributeName
//                   value:(id)helveticaBold
//                   range:NSMakeRange(0, 4)];
//    
//    //添加字体 目标字符串从下标6开始，截止到5个单位长度
//    [string addAttribute:(id)kCTFontAttributeName
//                   value:(id)helveticaBold
//                   range:NSMakeRange(6, 5)];
//    
//    //添加字体 目标字符串从下标109开始，截止到9个单位长度
//    [string addAttribute:(id)kCTFontAttributeName
//                   value:(id)helveticaBold
//                   range:NSMakeRange(109, 9)];
//    
//    //添加字体 目标字符串从下标223开始，截止到6个单位长度
//    [string addAttribute:(id)kCTFontAttributeName
//                   value:(id)helveticaBold
//                   range:NSMakeRange(223, 6)];
    
    //添加颜色，目标字符串从下标0开始，截止到4个单位长度
    [string addAttribute:(id)kCTForegroundColorAttributeName
                   value:(id)[UIColor blueColor].CGColor
                   range:NSMakeRange(0, [string length])];
    
//    //添加过程同上
//    [string addAttribute:(id)kCTForegroundColorAttributeName
//                   value:(id)[UIColor redColor].CGColor
//                   range:NSMakeRange(18, 3)];
//    
//    [string addAttribute:(id)kCTForegroundColorAttributeName
//                   value:(id)[UIColor greenColor].CGColor
//                   range:NSMakeRange(657, 6)];
//    
//    [string addAttribute:(id)kCTForegroundColorAttributeName
//                   value:(id)[UIColor blueColor].CGColor
//                   range:NSMakeRange(153, 6)];
//    
    //创建文本对齐方式
    CTTextAlignment alignment = kCTJustifiedTextAlignment;//左对齐 kCTRightTextAlignment为右对齐
    CTParagraphStyleSetting alignmentStyle;
    alignmentStyle.spec = kCTParagraphStyleSpecifierAlignment;//指定为对齐属性
    alignmentStyle.valueSize = sizeof(alignment);
    alignmentStyle.value = &alignment;
    
    //创建文本行间距
    CGFloat lineSpace=5.0f;//间距数据
    CTParagraphStyleSetting lineSpaceStyle;
    lineSpaceStyle.spec=kCTParagraphStyleSpecifierLineSpacing;//指定为行间距属性
    lineSpaceStyle.valueSize=sizeof(lineSpace);
    lineSpaceStyle.value=&lineSpace;
    
    //创建样式数组
    CTParagraphStyleSetting settings[] = {
        alignmentStyle,lineSpaceStyle
    };
    
    //设置样式
    CTParagraphStyleRef paragraphStyle = CTParagraphStyleCreate(settings, sizeof(settings));
    
    //给字符串添加样式attribute
    [string addAttribute:(id)kCTParagraphStyleAttributeName value:(id)paragraphStyle range:NSMakeRange(0, [string length])];

    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)string);
    
    CGMutablePathRef leftColumnPath = CGPathCreateMutable();
    int textGap = 20;
    CGPathAddRect(leftColumnPath, NULL, CGRectMake(textGap, 0, self.bounds.size.width - 2*textGap, self.bounds.size.height));
    
    CTFrameRef leftFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), leftColumnPath, NULL);
    
    // flip the coordinate system
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // draw
    CTFrameDraw(leftFrame, context);
    
    // cleanup
    CGPathRelease(leftColumnPath);
    CFRelease(framesetter);
    CFRelease(helvetica);
    CFRelease(helveticaBold);
    [string release];
    
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, 0.0f, 0.0f);
    CGContextAddLineToPoint(context, 0.0f, rect.size.height);
    CGContextMoveToPoint(context, rect.size.width, 0.0f);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    CGContextStrokePath(context);
    
    UIImage *picture = [UIImage imageNamed:@"home.png"];
    CGRect imageRect = CGRectInset(rect, 100, 50);
    [picture drawInRect:imageRect];
    
    UIGraphicsPushContext(context);
    
}

- (void)setAttributedString:(NSAttributedString *)string withImages:(NSArray*)imgs
{
    self.attributedString = string;
    self.images = imgs;
    
    CTTextAlignment alignment = kCTJustifiedTextAlignment;
    CTParagraphStyleSetting settings[] = {
        {kCTParagraphStyleSpecifierAlignment, sizeof(alignment), &alignment},
    };
    CTParagraphStyleRef paragraphStyle = CTParagraphStyleCreate(settings, sizeof(settings) / sizeof(settings[0]));
    NSDictionary *attrDictionary = [NSDictionary dictionaryWithObjectsAndKeys: (id)paragraphStyle, (NSString *)kCTParagraphStyleAttributeName, nil];
    
    NSMutableAttributedString *stringCopy = [[[NSMutableAttributedString alloc] initWithAttributedString:self.attributedString] autorelease];
    [stringCopy addAttributes:attrDictionary range:NSMakeRange(0, [self.attributedString length])];
    self.attributedString = (NSAttributedString*)stringCopy;
}

@end
