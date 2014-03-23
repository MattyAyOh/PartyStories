//
//  PSPartyGalleryViewController.h
//  PartyStories
//
//  Created by Gregory Klein on 2/24/14.
//  Copyright (c) 2014 Matthew Ao. All rights reserved.
//

#import "PSMenuNavigationViewController.h"
#import "MBProgressHUD.h"

@interface PSPartyGalleryViewController : PSMenuNavigationViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, MBProgressHUDDelegate> {
    UIImagePickerController *picker;
    UIImagePickerController *picker2;
    IBOutlet UIImageView *imageview;
    IBOutlet UIScrollView *photoScrollView;
    NSMutableArray *allImages;
    UIImage *image;
    
    

    
    
    MBProgressHUD *HUD;
    MBProgressHUD *refreshHUD;
}
- (IBAction)TakePhoto;
- (IBAction)ChooseExisting;
- (IBAction)refresh:(id)sender;
- (void)uploadImage:(NSData *)imageData;
- (void)setUpImages:(NSArray *)images;

@end
