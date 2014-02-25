//
//  PSMenuViewController.m
//  PartyStories
//
//  Created by Gregory Klein on 2/24/14.
//  Copyright (c) 2014 Matthew Ao. All rights reserved.
//

#import "PSMenuViewController.h"
#import "PSPartyGalleryViewController.h"
#import "RESideMenu.h"

@interface PSMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, readwrite, nonatomic) UITableView *tableView;

@end

@implementation PSMenuViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
   self.tableView = ({
      UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 54 * 5) / 2.0f, self.view.frame.size.width, 54 * 5) style:UITableViewStylePlain];
      tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
      tableView.delegate = self;
      tableView.dataSource = self;
      tableView.opaque = NO;
      tableView.backgroundColor = [UIColor clearColor];

      tableView.backgroundView = nil;
      tableView.backgroundColor = [UIColor clearColor];
      tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
      tableView.bounces = NO;
      tableView;
   });
   [self.view addSubview:self.tableView];
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
   switch (indexPath.row) {
      default:
         self.sideMenuViewController.contentViewController =
         [[UINavigationController alloc] initWithRootViewController:[[PSPartyGalleryViewController alloc] init]];
         [self.sideMenuViewController hideMenuViewController];
         break;
   }
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
   return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *cellIdentifier = @"Cell";

   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

   if (cell == nil) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
      cell.backgroundColor = [UIColor clearColor];
      cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
      cell.textLabel.textColor = [UIColor whiteColor];
      cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
      cell.selectedBackgroundView = [[UIView alloc] init];
   }

   NSArray *titles = @[@"Home", @"Calendar", @"Profile", @"Settings", @"Log Out"];
   NSArray *images = @[@"IconHome", @"IconCalendar", @"IconProfile", @"IconSettings", @"IconEmpty"];
   cell.textLabel.text = titles[indexPath.row];
   cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];

   return cell;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
   return UIStatusBarStyleLightContent;
}

@end
