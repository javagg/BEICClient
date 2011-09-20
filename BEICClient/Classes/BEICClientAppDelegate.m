//
//  BEICClientAppDelegate.m
//  BEICClient
//
//  Created by 李璐 on 11-7-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "BEICClientAppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ArticleViewController.h"
#import "PhotoTest1Controller.h"
#import "WebBrowserController.h"

@implementation BEICClientAppDelegate

@synthesize window;

@synthesize tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
    } else {
    }
    
    NSManagedObjectContext *context = [self managedObjectContext];  
    if (context == nil) {
    }  
    
    self.tabBarController = [[UITabBarController alloc] init];
    FirstViewController *vc1 = [[FirstViewController alloc] initWithNibName:@"NewsViewController" bundle:nil];
    SecondViewController *vc2 = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc2]; 
    [vc2 release];

    WebBrowserController *wc = [[WebBrowserController alloc] initWithNibName:nil bundle:nil];
    ArticleViewController *avc = [[ArticleViewController alloc] initWithNibName:@"ArticleViewController" bundle:nil];

    NSArray* controllers = [NSArray arrayWithObjects:vc1, nc, avc, wc, nil];
    [vc1 release];
    [nc release];
    [avc release];
    [wc release];
    
    tabBarController.viewControllers = controllers;
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window addSubview:tabBarController.view];
    [window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSError *error = nil; 
    if (managedObjectContext != nil) {  
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {  
            // Handle the error.  
        }  
    }  
}

- (void)dealloc {
    [managedObjectContext release];  
    [managedObjectModel release];  
    [persistentStoreCoordinator release];  
    
    self.tabBarController = nil;
    self.window = nil;
    
    [super dealloc];
}

- (NSManagedObjectContext *)managedObjectContext {  
    if (managedObjectContext != nil) {  
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];  
    if (coordinator != nil) {  
        managedObjectContext = [[NSManagedObjectContext alloc] init];  
        [managedObjectContext setPersistentStoreCoordinator: coordinator];  
    }  
    return managedObjectContext;  
}  

- (NSManagedObjectModel *)managedObjectModel {  
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];  
    return managedObjectModel;  
}  
 
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {  
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
    
    NSString *documentDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSURL *storeUrl = [NSURL fileURLWithPath:[documentDirectoryPath stringByAppendingPathComponent: @"Locations.sqlite"]];
    NSError *error = nil;  
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
    
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil  
          URL:storeUrl options:nil error:&error]) {
    }      
    
    return persistentStoreCoordinator;  
}  

@end
