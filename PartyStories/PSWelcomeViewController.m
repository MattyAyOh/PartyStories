//
//  PAPWelcomeViewController.m
//  Anypic
//
//  Created by Héctor Ramos on 5/10/12.
//  Copyright (c) 2013 Parse. All rights reserved.
//

#import "PSWelcomeViewController.h"
#import "PSAppDelegate.h"

@implementation PSWelcomeViewController


#pragma mark - UIViewController
- (void)loadView {
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    [backgroundImageView setImage:[UIImage imageNamed:@"Default.png"]];
    self.view = backgroundImageView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // If not logged in, present login view controller
    if (![PFUser currentUser]) {
        [(PSAppDelegate*)[[UIApplication sharedApplication] delegate] presentLoginViewControllerAnimated:NO];
        return;
    }
    // Present Anypic UI
    [(PSAppDelegate*)[[UIApplication sharedApplication] delegate] presentTabBarController];
    
//    // Refresh current user with server side data -- checks if user is still valid and so on
//    [[PFUser currentUser] refreshInBackgroundWithTarget:self selector:@selector(refreshCurrentUserCallbackWithResult:error:)];
}


#pragma mark - ()
//
//- (void)refreshCurrentUserCallbackWithResult:(PFObject *)refreshedObject error:(NSError *)error {
//    // A kPFErrorObjectNotFound error on currentUser refresh signals a deleted user
//    if (error && error.code == kPFErrorObjectNotFound) {
//        NSLog(@"User does not exist.");
//        [(PSAppDelegate*)[[UIApplication sharedApplication] delegate] logOut];
//        return;
//    }
//
//    // Check if user is missing a Facebook ID
//    if ([PSUtility userHasValidFacebookData:[PFUser currentUser]]) {
//        // User has Facebook ID.
//        
//        // refresh Facebook friends on each launch
//        [FBRequestConnection startForMyFriendsWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//            if (!error) {
//                if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(facebookRequestDidLoad:)]) {
//                    [[UIApplication sharedApplication].delegate performSelector:@selector(facebookRequestDidLoad:) withObject:result];
//                }
//            } else {
//                if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(facebookRequestDidFailWithError:)]) {
//                    [[UIApplication sharedApplication].delegate performSelector:@selector(facebookRequestDidFailWithError:) withObject:error];
//                }
//            }
//        }];
//    } else {
//        NSLog(@"Current user is missing their Facebook ID");
//        [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//            if (!error) {
//                if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(facebookRequestDidLoad:)]) {
//                    [[UIApplication sharedApplication].delegate performSelector:@selector(facebookRequestDidLoad:) withObject:result];
//                }
//            } else {
//                if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(facebookRequestDidFailWithError:)]) {
//                    [[UIApplication sharedApplication].delegate performSelector:@selector(facebookRequestDidFailWithError:) withObject:error];
//                }
//            }
//        }];
//    }
//}
//
@end
