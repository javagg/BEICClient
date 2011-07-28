//
//  ArticleViewController.m
//  BEICClient
//
//  Created by 李璐 on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ArticleViewController.h"


@implementation ArticleViewController

@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self != nil) {
        self.title = @"My View Controller";   
    }
    return self;
}

- (void)viewDidLoad {
    NSError *error = nil;
    NSString *template = [NSString stringWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"HtmlTemplate" ofType:@"txt"] encoding: NSUTF8StringEncoding error:&error];
    
    // error-checking omitted
//    NSString *htmlString = [NSString stringWithFormat: template];
    
    NSString *html = [[[NSString alloc] initWithFormat:(@"<html><head><style type=\"text/css\">body { text-overflow: ellipsis; font-size: 14px;width: 300px;font-family: Helvetica, Verdana, Arial;}table {text-overflow: hidden; word-wrap: break-word font-size: 14px;width: 300px;}tr {padding: 5px;}h1 {font-size: 16px;}h2 {font-size: 14px;color: #aa1121;}h3 {font-size: 14px;}th {color: #aa1121;}li {text-overflow: ellipsis;}</style></head><body><h1>%@</h1><p>%@ - %@</p>%@</body></html>"), @"title", @"date", @"date", @"内容"] autorelease]; 
    NSString *htmlString = @"<html><head></head><body>这是网页内容</body></html>";
    [webView loadHTMLString:html baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath]]];
}

- (void)dealloc {
    self.webView = nil;
    
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (IBAction)changeTextFontSize:(id)sender {
    switch ([sender tag]) {
        case 1: // A-
            textFontSize = (textFontSize > 50) ? textFontSize -5 : textFontSize;
            break;
        case 2: // A+
            textFontSize = (textFontSize < 160) ? textFontSize +5 : textFontSize;
            break;
    }
    
    NSString *jsString = [[NSString alloc] initWithFormat:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '%d%%'", 
                          textFontSize];
    [webView stringByEvaluatingJavaScriptFromString:jsString];
    [jsString release];
}


@end

