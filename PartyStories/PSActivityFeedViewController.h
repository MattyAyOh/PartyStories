//
//  PAPActivityFeedViewController.h
//  Anypic
//
//  Created by Mattieu Gamache-Asselin on 5/9/12.
//  Copyright (c) 2013 Parse. All rights reserved.
//

#import "PSActivityCell.h"

@interface PSActivityFeedViewController : PFQueryTableViewController <PSActivityCellDelegate>

+ (NSString *)stringForActivityType:(NSString *)activityType;

@end
