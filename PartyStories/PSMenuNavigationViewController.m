//
//  PSMenuNavigationViewController.m
//  PartyStories
//
//  Created by Gregory Klein on 2/24/14.
//  Copyright (c) 2014 Matthew Ao. All rights reserved.
//

#import "PSMenuNavigationViewController.h"
#import "RESideMenu.h"

@interface PSMenuNavigationViewController ()
@end

@implementation PSMenuNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
   if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
   {
   }
   return self;
}

- (void)viewDidLoad
{
   [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:(UIImage *) [[UIImage imageNamed:@"IconMenu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(showMenu)];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:(UIImage *) [[UIImage imageNamed:@"IconCamera"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(showMenu)];
}

- (void)showMenu
{
   [self.sideMenuViewController presentMenuViewController];
}

@end
