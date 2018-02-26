//
//  InfoWindow.h
//  Spray Optimizer
//
//  Created by Daniel Carmo on 2015-07-21.
//  Copyright (c) 2015 SpeakFeel. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface InfoWindow : UIView <NSCopying>

@property (strong, nonatomic, readonly) UIBarButtonItem *barButtonItem;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSAttributedString *attributedText;

- (void)addToView:(UIView *)view;

- (void)open;
- (void)close;

@end
