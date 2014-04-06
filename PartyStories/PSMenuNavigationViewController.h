//
//  PSMenuNavigationViewController.h
//  PartyStories
//
//  Created by Gregory Klein on 2/24/14.
//  Copyright (c) 2014 Matthew Ao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import <Parse/Parse.h>


@interface PSMenuNavigationViewController : PFQueryTableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, MBProgressHUDDelegate> {
    IBOutlet UIImageView *imageview;
    UIImagePickerController *picker;
    UIImagePickerController *picker2;
    UIImage *image;

    
    MBProgressHUD *HUD;
    MBProgressHUD *refreshHUD;
}

- (IBAction)TakePhoto;
- (IBAction)ChooseExisting;
- (void)uploadImage:(NSData *)imageData;
- (IBAction)refresh:(id)sender;





@end
