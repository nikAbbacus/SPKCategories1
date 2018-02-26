//
//  UIView+Gestures.h
//  CPI Satcom Product Guide
//
//  Created by Daniel Carmo on 2016-04-22.
//  Copyright © 2016 CPI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Gestures)

- (UITapGestureRecognizer *)gst_addSingleTapGestureWithTarget:(id)target action:(SEL)selector;

- (UILongPressGestureRecognizer *)gst_longPressWithTarget:(id)target action:(SEL)selector;
- (UILongPressGestureRecognizer *)gst_longPressWithTarget:(id)target action:(SEL)selector minimumPressDuration:(CFTimeInterval)interval allowableMovement:(CGFloat)movement;

@end
