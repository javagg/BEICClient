//
//  CTopBubbleUserNotification.m
//  UserNotificationManager
//
//  Created by Francis Chong on 10年11月16日.
//  Copyright 2010 Ignition Soft Limited. All rights reserved.
//

#import "CTopBubbleUserNotificationStyle.h"

#import "CUserNotification.h"
#import "CBubbleView.h"
#import "UIView_AnimationExtensions.h"
#import "CUserNotificationManager.h"


@implementation CTopBubbleUserNotificationStyle

+ (void)load
{
	NSAutoreleasePool *thePool = [[NSAutoreleasePool alloc] init];
	[[CUserNotificationManager instance] registerStyleName:@"BUBBLE-BOTTOM" class:self options:NULL];
	[thePool release];
}

- (void)showNotification:(CUserNotification *)inNotification
{
	UIView *theMainView = self.manager.mainView;
	
	CBubbleView *theBubbleView = [[[CBubbleView alloc] initWithFrame:CGRectMake(0, theMainView.bounds.size.height - 44.0, theMainView.bounds.size.width, 44.0)] autorelease];
	theBubbleView.titleLabel.text = inNotification.title;
	theBubbleView.messageLabel.text = inNotification.message;
	self.view = theBubbleView;	
	[theMainView addSubview:view withAnimationType:ViewAnimationType_SlideUp];
}

- (void)hideNotification:(CUserNotification *)inNotification
{
	[self.view removeFromSuperviewWithAnimationType:ViewAnimationType_SlideDown];
}

@end
