//
//  NSLayoutConstraint+CommonConstraints.m
//  IMPACT
//
//  Created by Daniel Carmo on 2016-01-19.
//  Copyright © 2016 Jeffrey Sambells. All rights reserved.
//

#import "NSLayoutConstraint+CommonConstraints.h"

@implementation NSLayoutConstraint (CommonConstraints)

+ (NSDictionary *)cst_centerView:(UIView *)view inView:(UIView *)superView {
    NSLayoutConstraint *centerHorizontalConstraint = [NSLayoutConstraint cst_centerHorizontally:view inSuperView:superView];
    NSLayoutConstraint *centerVerticalConstraint = [NSLayoutConstraint cst_centerVertically:view inSuperView:superView];
    
    return @{
             kCenterVerticalConstraint: centerVerticalConstraint,
             kCenterHorizontalConstraint: centerHorizontalConstraint
             };
}

+ (NSLayoutConstraint *)cst_centerHorizontally:(UIView *)view inSuperView:(UIView *)superView {
    // Center horizontally
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:superView
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1.0
                                                                   constant:0];
    
    [superView addConstraint:constraint];
    
    return constraint;
}

+ (NSLayoutConstraint *)cst_centerVertically:(UIView *)view inSuperView:(UIView *)superView {
    // Center vertically
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeCenterY
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:superView
                                                                  attribute:NSLayoutAttributeCenterY
                                                                 multiplier:1.0
                                                                   constant:0];
    
    [superView addConstraint:constraint];
    
    return constraint;
}

+ (NSDictionary *)cst_height:(CGFloat)heigth width:(CGFloat)width forView:(UIView *)view {
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint cst_height:heigth forView:view];
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint cst_width:width forView:view];
    
    return @{
             kHeightConstraint: heightConstraint,
             kWidthConstraint: widthConstraint
             };
}

+ (NSLayoutConstraint *)cst_height:(CGFloat)height forView:(UIView *)view {
    NSNumber *viewHeight = @(height);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(viewHeight)]"
                                                                   options:0
                                                                   metrics:NSDictionaryOfVariableBindings(viewHeight)
                                                                     views:NSDictionaryOfVariableBindings(view)];
    [view addConstraints:constraints];
    
    return [constraints firstObject];
}

+ (NSLayoutConstraint *)cst_width:(CGFloat)width forView:(UIView *)view {
    NSNumber *viewWidth = @(width);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view(viewWidth)]"
                                                                   options:0
                                                                   metrics:NSDictionaryOfVariableBindings(viewWidth)
                                                                     views:NSDictionaryOfVariableBindings(view)];
    [view addConstraints:constraints];
    
    return [constraints firstObject];
}

+ (NSDictionary *)cst_paddingToSuperView:(CGFloat)padding toView:(UIView *)view inSuperView:(UIView *)superView {
    NSDictionary *horizontalConstraints = [NSLayoutConstraint cst_paddingHorizontallyToSuperView:padding toView:view inSuperView:superView];
    NSDictionary *verticalConstraints = [NSLayoutConstraint cst_paddingVerticallyToSuperView:padding toView:view inSuperView:superView];
    
    return @{
             kPaddingTopConstraint: verticalConstraints[kPaddingTopConstraint],
             kPaddingRightConstraint: horizontalConstraints[kPaddingRightConstraint],
             kPaddingBottomConstraint: verticalConstraints[kPaddingBottomConstraint],
             kPaddingLeftConstraint: horizontalConstraints[kPaddingLeftConstraint]
             };
}

+ (NSDictionary *)cst_paddingHorizontallyToSuperView:(CGFloat)padding toView:(UIView *)view inSuperView:(UIView *)superView {
    NSLayoutConstraint *leftConstraintToSuperview = [NSLayoutConstraint cst_paddingLeftToSuperView:padding toView:view inSuperView:superView];
    NSLayoutConstraint *rightConstraintToSuperview = [NSLayoutConstraint cst_paddingRightToSuperView:padding toView:view inSuperView:superView];
    
    return @{
             kPaddingRightConstraint: rightConstraintToSuperview,
             kPaddingLeftConstraint: leftConstraintToSuperview
             };
}

+ (NSLayoutConstraint *)cst_paddingLeftToSuperView:(CGFloat)padding toView:(UIView *)view inSuperView:(UIView *)superView {
    NSNumber *viewPadding = @(padding);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(viewPadding)-[view]"
                                                                   options:0
                                                                   metrics:NSDictionaryOfVariableBindings(viewPadding)
                                                                     views:NSDictionaryOfVariableBindings(view)];
    
    [superView addConstraints:constraints];
    
    return [constraints firstObject];
}

+ (NSLayoutConstraint *)cst_paddingRightToSuperView:(CGFloat)padding toView:(UIView *)view inSuperView:(UIView *)superView {
    NSNumber *viewPadding = @(padding);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]-(viewPadding)-|"
                                                                   options:0
                                                                   metrics:NSDictionaryOfVariableBindings(viewPadding)
                                                                     views:NSDictionaryOfVariableBindings(view)];
    
    [superView addConstraints:constraints];
    
    return [constraints firstObject];
}

+ (NSLayoutConstraint *)cst_paddingRight:(CGFloat)padding fromView:(UIView *)fromView toView:(UIView *)toView inSuperView:(UIView *)superView {
    NSNumber *viewPadding = @(padding);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[fromView]-(viewPadding)-[toView]"
                                                                   options:0
                                                                   metrics:NSDictionaryOfVariableBindings(viewPadding)
                                                                     views:NSDictionaryOfVariableBindings(fromView, toView)];
    
    [superView addConstraints:constraints];
    
    return [constraints firstObject];
}

+ (NSLayoutConstraint *)cst_paddingLeft:(CGFloat)padding fromView:(UIView *)fromView toView:(UIView *)toView inSuperView:(UIView *)superView {
    NSNumber *viewPadding = @(padding);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[toView]-(viewPadding)-[fromView]"
                                                                   options:0
                                                                   metrics:NSDictionaryOfVariableBindings(viewPadding)
                                                                     views:NSDictionaryOfVariableBindings(fromView, toView)];
    
    [superView addConstraints:constraints];
    
    return [constraints firstObject];
}

+ (NSDictionary *)cst_paddingVerticallyToSuperView:(CGFloat)padding toView:(UIView *)view inSuperView:(UIView *)superView {
    NSLayoutConstraint *topConstraintToSuperView = [NSLayoutConstraint cst_paddingTopToSuperView:padding toView:view inSuperView:superView];
    NSLayoutConstraint *bottomConstraintToSuperView = [NSLayoutConstraint cst_paddingBottomToSuperView:padding toView:view inSuperView:superView];
    
    return @{
             kPaddingTopConstraint: topConstraintToSuperView,
             kPaddingBottomConstraint: bottomConstraintToSuperView
             };
}

+ (NSLayoutConstraint *)cst_paddingTopToSuperView:(CGFloat)padding toView:(UIView *)view inSuperView:(UIView *)superView {
    NSNumber *viewPadding = @(padding);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(viewPadding)-[view]"
                                                                   options:0
                                                                   metrics:NSDictionaryOfVariableBindings(viewPadding)
                                                                     views:NSDictionaryOfVariableBindings(view)];
    
    [superView addConstraints:constraints];
    
    return [constraints firstObject];
}

+ (NSLayoutConstraint *)cst_paddingBottomToSuperView:(CGFloat)padding toView:(UIView *)view inSuperView:(UIView *)superView {
    NSNumber *viewPadding = @(padding);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-(viewPadding)-|"
                                                                   options:0
                                                                   metrics:NSDictionaryOfVariableBindings(viewPadding)
                                                                     views:NSDictionaryOfVariableBindings(view)];
    
    [superView addConstraints:constraints];
    
    return [constraints firstObject];
}

+ (NSLayoutConstraint *)cst_paddingTop:(CGFloat)padding fromView:(UIView *)fromView toView:(UIView *)toView inSuperView:(UIView *)superView {
    NSNumber *viewPadding = @(padding);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[toView]-(viewPadding)-[fromView]"
                                                                   options:0
                                                                   metrics:NSDictionaryOfVariableBindings(viewPadding)
                                                                     views:NSDictionaryOfVariableBindings(fromView, toView)];
    
    [superView addConstraints:constraints];
    
    return [constraints firstObject];
}

+ (NSLayoutConstraint *)cst_paddingBottom:(CGFloat)padding fromView:(UIView *)fromView toView:(UIView *)toView inSuperView:(UIView *)superView {
    NSNumber *viewPadding = @(padding);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[fromView]-(viewPadding)-[toView]"
                                                                   options:0
                                                                   metrics:NSDictionaryOfVariableBindings(viewPadding)
                                                                     views:NSDictionaryOfVariableBindings(fromView, toView)];
    
    [superView addConstraints:constraints];
    
    return [constraints firstObject];
}

@end
