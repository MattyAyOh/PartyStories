//
//  PSAppDelegate.h
//  PartyStories
//
//  Created by Matthew Ao on 2/24/14.
//  Copyright (c) 2014 Matthew Ao. All rights reserved.
//

#import "PSTabBarController.h"

@interface PSAppDelegate : UIResponder <UIApplicationDelegate, NSURLConnectionDataDelegate, UITabBarControllerDelegate, PFLogInViewControllerDelegate>

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong) PSTabBarController *tabBarController;
@property (nonatomic, strong) UINavigationController *navController;

@property (nonatomic, readonly) int networkStatus;

- (BOOL)isParseReachable;

- (void)presentLoginViewController;
- (void)presentLoginViewControllerAnimated:(BOOL)animated;
- (void)presentTabBarController;

- (void)logOut;
//
//- (void)facebookRequestDidLoad:(id)result;
//- (void)facebookRequestDidFailWithError:(NSError *)error;

@end

