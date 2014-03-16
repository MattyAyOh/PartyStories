//
//  PAPPhotoDetailsHeaderView.h
//  Anypic
//
//  Created by Mattieu Gamache-Asselin on 5/15/12.
//  Copyright (c) 2013 Parse. All rights reserved.
//

@protocol PSPhotoDetailsHeaderViewDelegate;

@interface PSPhotoDetailsHeaderView : UIView

/*! @name Managing View Properties */

/// The photo displayed in the view
@property (nonatomic, strong, readonly) PFObject *photo;

/// The user that took the photo
@property (nonatomic, strong, readonly) PFUser *photographer;

/// Array of the users that liked the photo
@property (nonatomic, strong) NSArray *likeUsers;

/// Heart-shaped like button
@property (nonatomic, strong, readonly) UIButton *likeButton;

/*! @name Delegate */
@property (nonatomic, strong) id<PSPhotoDetailsHeaderViewDelegate> delegate;

+ (CGRect)rectForView;

- (id)initWithFrame:(CGRect)frame photo:(PFObject*)aPhoto;
- (id)initWithFrame:(CGRect)frame photo:(PFObject*)aPhoto photographer:(PFUser*)aPhotographer likeUsers:(NSArray*)theLikeUsers;

- (void)setLikeButtonState:(BOOL)selected;
- (void)reloadLikeBar;
@end

/*!
 The protocol defines methods a delegate of a PAPPhotoDetailsHeaderView should implement.
 */
@protocol PSPhotoDetailsHeaderViewDelegate <NSObject>
@optional

/*!
 Sent to the delegate when the photgrapher's name/avatar is tapped
 @param button the tapped UIButton
 @param user the PFUser for the photograper
 */
- (void)photoDetailsHeaderView:(PSPhotoDetailsHeaderView *)headerView didTapUserButton:(UIButton *)button user:(PFUser *)user;

@end