//
//  PSMenuViewController.m
//  PartyStories
//
//  Created by Gregory Klein on 2/24/14.
//  Copyright (c) 2014 Matthew Ao. All rights reserved.
//

#import "PSMenuViewController.h"
#import "PSMenuNavigationViewController.h"
#import "PSPartyGalleryViewController.h"
#import "PSAccountViewController.h"
#import "PSRankingsViewController.h"
#import "PSSettingsViewController.h"
#import "RESideMenu.h"

@interface PSMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, readwrite, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *psViewControllers;

@end

@implementation PSMenuViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
   self.tableView = ({
      CGRect tableFrame = CGRectMake(0, (self.view.frame.size.height - 54 * 5) * .5f,
                                     self.view.frame.size.width, 54 * 5);
      UITableView *tableView = [[UITableView alloc] initWithFrame:tableFrame
                                                            style:UITableViewStylePlain];

      tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                                   UIViewAutoresizingFlexibleBottomMargin |
                                   UIViewAutoresizingFlexibleWidth;
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

   [self setupPSViewControllers];
   [self.view addSubview:self.tableView];
}

#pragma mark - Helper Methods
- (void)setupPSViewControllers
{
   self.psViewControllers = @[[[PSPartyGalleryViewController alloc] init],
                              [[PSRankingsViewController alloc] init],
                              [[PSAccountViewController alloc] init],
                              [[PSSettingsViewController alloc] init]];
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
   PSMenuNavigationViewController *viewController = [self.psViewControllers objectAtIndex:indexPath.row];
   self.sideMenuViewController.contentViewController = [[UINavigationController alloc] initWithRootViewController:viewController];
   [self.sideMenuViewController hideMenuViewController];
//   switch (indexPath.row)
//   {
//      default:
//         self.sideMenuViewController.contentViewController =
//         [[UINavigationController alloc] initWithRootViewController:[[PSPartyGalleryViewController alloc] init]];
//         [self.sideMenuViewController hideMenuViewController];
//         break;
//   }
}

#pragma mark - UITableView Datasource
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
   return [self.psViewControllers count];
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

   NSArray *titles = @[@"Activity", @"Rankings", @"Account", @"Settings"];
   NSArray *images = @[@"IconHome", @"IconCalendar", @"IconProfile", @"IconSettings"];
   cell.textLabel.text = titles[indexPath.row];
   cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];

   return cell;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
   return UIStatusBarStyleLightContent;
}

@end
