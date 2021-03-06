//
//  PSPartyGalleryViewController.h
//  PartyStories
//
//  Created by Gregory Klein on 2/24/14.
//  Copyright (c) 2014 Matthew Ao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSMenuNavigationViewController.h"
#import "MBProgressHUD.h"

@interface PSPartyGalleryViewController : PSMenuNavigationViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, MBProgressHUDDelegate> {
    IBOutlet UITableView *photoScrollView;
    NSMutableArray *allImages;
    
}
@end
