//
//  PAPFindFriendsCell.h
//  Anypic
//
//  Created by Mattieu Gamache-Asselin on 5/31/12.
//  Copyright (c) 2013 Parse. All rights reserved.
//

@class PSProfileImageView;
@protocol PSFindFriendsCellDelegate;

@interface PSFindFriendsCell : UITableViewCell {
    id _delegate;
}

@property (nonatomic, strong) id<PSFindFriendsCellDelegate> delegate;

/*! The user represented in the cell */
@property (nonatomic, strong) PFUser *user;
@property (nonatomic, strong) UILabel *photoLabel;
@property (nonatomic, strong) UIButton *followButton;

/*! Setters for the cell's content */
- (void)setUser:(PFUser *)user;

- (void)didTapUserButtonAction:(id)sender;
- (void)didTapFollowButtonAction:(id)sender;

/*! Static Helper methods */
+ (CGFloat)heightForCell;

@end

/*!
 The protocol defines methods a delegate of a PAPFindFriendsCell should implement.
 */
@protocol PSFindFriendsCellDelegate <NSObject>
@optional

/*!
 Sent to the delegate when a user button is tapped
 @param aUser the PFUser of the user that was tapped
 */
- (void)cell:(PSFindFriendsCell *)cellView didTapUserButton:(PFUser *)aUser;
- (void)cell:(PSFindFriendsCell *)cellView didTapFollowButton:(PFUser *)aUser;

@end
