//
//  BEICClientAppDelegate.h
//  BEICClient
//
//  Created by 李璐 on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BEICClientAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end