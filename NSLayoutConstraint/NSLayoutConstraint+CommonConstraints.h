//
//  NSLayoutConstraint+CommonConstraints.h
//  IMPACT
//
//  Created by Daniel Carmo on 2016-01-19.
//  Copyright © 2016 Jeffrey Sambells. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCenterVerticalConstraint @"kCenterVerticalConstraint"
#define kCenterHorizontalConstraint @"kCenterHorizontalConstraint"

#define kHeightConstraint @"kHeightConstraint"
#define kWidthConstraint @"kWidthConstraint"

#define kPaddingTopConstraint @"kPaddingTopConstraint"
#define kPaddingRightConstraint @"kPaddingRightConstraint"
#define kPaddingBottomConstraint @"kPaddingBottomConstraint"
#define kPaddingLeftConstraint @"kPaddingLeftConstraint"

@interface NSLayoutConstraint (CommonConstraints)

// TODO: Create Separate Categories for Padding, Centering, Dimensions etc. Use this one as the main import for all
// TODO: Function with array of views and padding amount to be added between them
// TODO: Function for making views equal widths
// TODO: Function for making views equal heights
// TODO: Function for making views equal top
// TODO: Function for making views equal bottom
// TODO: Function for making views equal leading
// TODO: Function for making views equal trailing

/**
 *  Centers the view Horizontally and Vertically in the superview.
 *
 *  @param view      View to be centered in the superView
 *  @param superView SuperView containing the view
 *
 *  @return Resulting centering constraints using the keys kCenterVerticalConstraint and kCenterHorizontalConstraint
 */
+ (NSDictionary *)cst_centerView:(UIView *)view inView:(UIView *)superView;
/**
 *  Centers the view Horizontally in the superview.
 *
 *  @param view      View to be centered in the superView
 *  @param superView SuperView containing the view
 *
 *  @return Resulting centering constraint
 */
+ (NSLayoutConstraint *)cst_centerHorizontally:(UIView *)view inSuperView:(UIView *)superView;
/**
 *  Centers the view Vertically in the superview.
 *
 *  @param view      View to be centered in the superView
 *  @param superView SuperView containing the view
 *
 *  @return Resulting centering constraint
 */
+ (NSLayoutConstraint *)cst_centerVertically:(UIView *)view inSuperView:(UIView *)superView;

/**
 *  Constrains the given view to the height and width that is provided
 *
 *  @warning Assumes options:0 in visual constraint
 *
 *  @param height   Height of the view
 *  @param width    Width of the view
 *  @param view     View to constraint
 *
 *  @return Resulting size constraints using the keys kHeightConstraint and kWidthConstraint
 */
+ (NSDictionary *)cst_height:(CGFloat)heigth width:(CGFloat)width forView:(UIView *)view;
/**
 *  Constrains the given view to the height that is provided
 *
 *  @warning Assumes options:0 in visual constraint
 *
 *  @param height   Height of the view
 *  @param view     View to constraint
 *
 *  @return Resulting constraint for the height of the view
 */
+ (NSLayoutConstraint *)cst_height:(CGFloat)height forView:(UIView *)view;
/**
 *  Constrains the given view to the width that is provided
 *
 *  @warning Assumes options:0 in visual constraint
 *
 *  @param width Width of the view
 *  @param view  View to constraint
 *
 *  @return Resulting constraint for the width of the view
 */
+ (NSLayoutConstraint *)cst_width:(CGFloat)width forView:(UIView *)view;

/**
 *  Applies padding from the top, right, bottom and left edges of the view to the superView
 *
 *  @warning Assumes options:0 in visual constraint
 *
 *  @param padding   Amount of padding to set from the view to it's parents top and bottom edge.
 *  @param view      The view contained in the parent to add padding to.
 *  @param superView The superView of the given view to add the padding to. The constraints are ultimately added to this view.
 *
 *  @return Resulting layout constraints in a dictionary with keys kPaddingTopConstraint, kPaddingRightConstraint, kPaddingBottomConstraint, kPaddingLeftConstraint
 */
+ (NSDictionary *)cst_paddingToSuperView:(CGFloat)padding toView:(UIView *)view inSuperView:(UIView *)superView;

/**
 *  Applies padding from the left and right edges of the view to the superView
 *
 *  @warning Assumes options:0 in visual constraint
 *
 *  @param padding   Amount of padding to set from the view to it's parents top and bottom edge.
 *  @param view      The view contained in the parent to add padding to.
 *  @param superView The superView of the given view to add the padding to. The constraints are ultimately added to this view.
 *
 *  @return Resulting layout constraints in a dictionary with keys kPaddingRightConstraint, kPaddingLeftConstraint
 */
+ (NSDictionary *)cst_paddingHorizontallyToSuperView:(CGFloat)padding toView:(UIView *)view inSuperView:(UIView *)superView;
/**
 *  Applies padding from the left edge of the view to the superView
 *
 *  @warning Assumes options:0 in visual constraint
 *
 *  @param padding   Amount of padding to set from the view to it's parents top and bottom edge.
 *  @param view      The view contained in the parent to add padding to.
 *  @param superView The superView of the given view to add the padding to. The constraints are ultimately added to this view.
 *
 *  @return Resulting layout constraint from the toView's left edge to the superview
 */
+ (NSLayoutConstraint *)cst_paddingLeftToSuperView:(CGFloat)padding toView:(UIView *)view inSuperView:(UIView *)superView;
/**
 *  Applies padding from the right edge of the view to the superView
 *
 *  @warning Assumes options:0 in visual constraint
 *
 *  @param padding   Amount of padding to set from the view to it's parents top and bottom edge.
 *  @param view      The view contained in the parent to add padding to.
 *  @param superView The superView of the given view to add the padding to. The constraints are ultimately added to this view.
 *
 *  @return Resulting layout constraint from the toView's right edge to the superview
 */
+ (NSLayoutConstraint *)cst_paddingRightToSuperView:(CGFloat)padding toView:(UIView *)view inSuperView:(UIView *)superView;
/**
 *  Applies padding from the right edge of the fromView to the left edge of the toView
 *
 *  @warning Assumes options:0 in visual constraint
 *  @warning UNTESTED
 *  TODO: Test
 *
 *  @param padding   Amount of padding to set between the views.
 *  @param fromView  The view which the padding will start at.
 *  @param toView    The view which the padding will end at.
 *  @param superView The view containing the views to add the padding to. The constraints are ultimately added to this view.
 *
 *  @return Resulting layout constraint from the right edge of the fromView to the left edge of the toView
 */
+ (NSLayoutConstraint *)cst_paddingRight:(CGFloat)padding fromView:(UIView *)fromView toView:(UIView *)toView inSuperView:(UIView *)superView;
/**
 *  Applies padding from the left edge of the fromView to the right edge of the toView
 *
 *  @warning Assumes options:0 in visual constraint
 *  @warning UNTESTED
 *  TODO: Test
 *
 *  @param padding   Amount of padding to set between the views.
 *  @param fromView  The view which the padding will start at.
 *  @param toView    The view which the padding will end at.
 *  @param superView The view containing the views to add the padding to. The constraints are ultimately added to this view.
 *
 *  @return Resulting layout constraint from the left edge of the fromView to the right edge of the toView
 */
+ (NSLayoutConstraint *)cst_paddingLeft:(CGFloat)padding fromView:(UIView *)fromView toView:(UIView *)toView inSuperView:(UIView *)superView;

/**
 *  Applies padding from the top and bottom of the view to the superView
 *
 *  @warning Assumes options:0 in visual constraint
 *
 *  @param padding   Amount of padding to set from the view to it's parents top and bottom edge.
 *  @param view      The view contained in the parent to add padding to.
 *  @param superView The superView of the given view to add the padding to. The constraints are ultimately added to this view.
 *
 *  @return Resulting layout constraints in a dictionary with keys kPaddingTopConstraint, kPaddingBottomConstraint
 */
+ (NSDictionary *)cst_paddingVerticallyToSuperView:(CGFloat)padding toView:(UIView *)view inSuperView:(UIView *)superView;
/**
 *  Applies padding from the top of the view to the superView
 *
 *  @warning Assumes options:0 in visual constraint
 *
 *  @param padding   Amount of padding to set from the view to it's parents top and bottom edge.
 *  @param view      The view contained in the parent to add padding to.
 *  @param superView The superView of the given view to add the padding to. The constraints are ultimately added to this view.
 *
 *  @return Resulting layout constraint from the toView's top edge to the superview
 */
+ (NSLayoutConstraint *)cst_paddingTopToSuperView:(CGFloat)padding toView:(UIView *)view inSuperView:(UIView *)superView;
/**
 *  Applies padding from the bottom of the view to the superView
 *
 *  @warning Assumes options:0 in visual constraint
 *
 *  @param padding   Amount of padding to set from the view to it's parents top and bottom edge.
 *  @param view      The view contained in the parent to add padding to.
 *  @param superView The superView of the given view to add the padding to. The constraints are ultimately added to this view.
 *
 *  @return Resultings layout constraint from the toView's bottom edge to the superview
 */
+ (NSLayoutConstraint *)cst_paddingBottomToSuperView:(CGFloat)padding toView:(UIView *)view inSuperView:(UIView *)superView;
/**
 *  Applies padding from the top of the fromView to the bottom of the toView
 *
 *  @warning Assumes options:0 in visual constraint
 *  @warning UNTESTED
 *  TODO: Test
 *
 *  @param padding   Amount of padding to set between the views.
 *  @param fromView  The view which the padding will start at.
 *  @param toView    The view which the padding will end at.
 *  @param superView The view containing the views to add the padding to. The constraints are ultimately added to this view.
 *
 *  @return Resulting layout constraint from the top edge of the fromView to the bottom edge of the toView
 */
+ (NSLayoutConstraint *)cst_paddingTop:(CGFloat)padding fromView:(UIView *)fromView toView:(UIView *)toView inSuperView:(UIView *)superView;
/**
 *  Applies padding from the bottom of the fromView to the top of the toView
 *
 *  @warning Assumes options:0 in visual constraint
 *  @warning UNTESTED
 *  TODO: Test
 *
 *  @param padding   Amount of padding to set between the views.
 *  @param fromView  The view which the padding will start at.
 *  @param toView    The view which the padding will end at.
 *  @param superView The view containing the views to add the padding to. The constraints are ultimately added to this view.
 *
 *  @return Resulting layout constraint from the bottom edge of the fromView to the top edge of the toView
 */
+ (NSLayoutConstraint *)cst_paddingBottom:(CGFloat)padding fromView:(UIView *)fromView toView:(UIView *)toView inSuperView:(UIView *)superView;

@end
