//
//  FISAppDelegate.m
//  Collections2
//
//  Created by Chris Gonzales on 5/31/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSDictionary *schools = @{
                @"flatiron school bk": @{
                        @"location": @"NYC"
                        },
                @"flatiron school": @{
                        @"location": @"NYC"
                        },
                @"dev boot camp": @{
                        @"location": @"SF"
                        },
                @"dev boot camp chicago": @{
                        @"location": @"Chicago"
                        },
                @"general assembly": @{
                        @"location": @"NYC"
                        },
                @"Hack Reactor": @{
                        @"location": @"SF"
                        }
              };
    
    NSMutableArray *cities = [NSMutableArray array];
    
    for (NSDictionary *school in schools) {
        NSString *city = schools[school][@"location"];
        
        
        [cities addObject:city];
    }
    
    NSOrderedSet *removedDuplicates = [NSOrderedSet orderedSetWithArray:cities];
 

 NSMutableDictionary *groupedSchoolsInCity = [[NSMutableDictionary alloc] init];
    for (NSString *city in removedDuplicates) {
        
        NSMutableArray *allSchoolsInCity = [NSMutableArray array];
        for (NSDictionary *school in schools) {
            NSString *schoolCity = schools[school][@"location"];
        
            if ([schoolCity isEqualToString:city]) {
                [allSchoolsInCity addObject:school];
            }
        }
       
        [groupedSchoolsInCity setValue:allSchoolsInCity forKey:city];
            NSLog(@"%@", groupedSchoolsInCity);
    }
    
    
              return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
