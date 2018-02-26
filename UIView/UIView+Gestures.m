//
//  UIView+Gestures.m
//  CPI Satcom Product Guide
//
//  Created by Daniel Carmo on 2016-04-22.
//  Copyright © 2016 CPI. All rights reserved.
//

#import "UIView+Gestures.h"

@implementation UIView (Gestures)

- (UITapGestureRecognizer *)gst_addSingleTapGestureWithTarget:(id)target action:(SEL)selector {
    //The setup code (in viewDidLoad in your view controller)
    UITapGestureRecognizer *singleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target
                                                                                       action:selector];
    
    singleTapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:singleTapGesture];
    return singleTapGesture;
}

- (UILongPressGestureRecognizer *)gst_longPressWithTarget:(id)target action:(SEL)selector {
    return [self gst_longPressWithTarget:target action:selector minimumPressDuration:0.5 allowableMovement:10];
}

- (UILongPressGestureRecognizer *)gst_longPressWithTarget:(id)target action:(SEL)selector minimumPressDuration:(CFTimeInterval)duration allowableMovement:(CGFloat)movement {
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:target
                                                                                                   action:selector];
    
    [longPressGesture setMinimumPressDuration:duration];
    [longPressGesture setAllowableMovement:movement];
    [self addGestureRecognizer:longPressGesture];
    return longPressGesture;
}

@end
