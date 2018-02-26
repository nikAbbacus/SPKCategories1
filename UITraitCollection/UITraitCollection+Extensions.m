//
//  UITraitCollection+Extensions.m
//  Spray Optimizer
//
//  Created by Daniel Carmo on 2015-08-10.
//  Copyright (c) 2015 SpeakFeel. All rights reserved.
//

#import "UITraitCollection+Extensions.h"

@implementation UITraitCollection (Extensions)

- (BOOL)isHCompactVCompact {
    return self.horizontalSizeClass == UIUserInterfaceSizeClassCompact && self.verticalSizeClass == UIUserInterfaceSizeClassCompact;
}

- (BOOL)horizontalOrVerticalIsCompact {
    UITraitCollection *traitCollection = [[UIApplication sharedApplication] keyWindow].traitCollection;
    return traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact || traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact;
}

- (BOOL)horizontalAndVerticalAreRegular {
    UITraitCollection *traitCollection = [[UIApplication sharedApplication] keyWindow].traitCollection;
    return traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular && traitCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular;
}

@end
