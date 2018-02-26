//
//  UITraitCollection+Extensions.h
//  Spray Optimizer
//
//  Created by Daniel Carmo on 2015-08-10.
//  Copyright (c) 2015 SpeakFeel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITraitCollection (Extensions)

- (BOOL)isHCompactVCompact;
- (BOOL)horizontalOrVerticalIsCompact;
- (BOOL)horizontalAndVerticalAreRegular;

@end
