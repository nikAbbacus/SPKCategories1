//
//  NSString+DeprecationHelpers.m
//  Gideons
//
//  Created by Jeffrey Sambells on 2015-07-23.
//  Copyright (c) 2015 Iversoft Solutions Inc. All rights reserved.
//

#import "NSString+DeprecationHelpers.h"

@implementation NSString (DeprecationHelpers)

- (CGSize)dh_attributedSizeWithFont:(UIFont *)font
{
    return [self sizeWithAttributes:@{ NSFontAttributeName: font }];
}

@end
