//
//  UIBarButtonItem+Appearance.m
//  Gideons
//
//  Created by Jeffrey Sambells on 2015-07-17.
//  Copyright (c) 2015 Iversoft Solutions Inc. All rights reserved.
//

// Fixes this issue http://stackoverflow.com/questions/18897470/ios7-excessive-navigationbar-button-padding

#import "UIBarButtonItem+Appearance.h"
#import <BlocksKit/BlocksKit+UIKit.h>
#import "NSString+DeprecationHelpers.h"

@implementation UIBarButtonItem (Appearance)

+ (UIBarButtonItem *)appearance_barItemWithTemplateImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage xOffset:(NSInteger)xOffset handler:(void (^)(id sender))handler
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake (0, 0, image.size.width, image.size.height)];
    [button bk_addEventHandler:handler forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    // [button setTintColor:[UIColor whiteColor]]; // #NewLife-954 iOS7 Bugs
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        [button setImageEdgeInsets:UIEdgeInsetsMake (0, xOffset, 0, -xOffset)];
    }

    UIBarButtonItem *customUIBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return customUIBarButtonItem;
}

+ (UIBarButtonItem *)appearance_barItemWithOriginalImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage xOffset:(NSInteger)xOffset handler:(void (^)(id sender))handler
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake (0, 0, image.size.width, image.size.height)];
    [button bk_addEventHandler:handler forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    // [button setTintColor:[UIColor whiteColor]]; // #NewLife-954 iOS7 Bugs
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        [button setImageEdgeInsets:UIEdgeInsetsMake (0, xOffset, 0, -xOffset)];
    }

    UIBarButtonItem *customUIBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return customUIBarButtonItem;
}

+ (UIBarButtonItem *)appearance_barItemWithTitle:(NSString *)title xOffset:(NSInteger)xOffset handler:(void (^)(id sender))handler
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button setFrame:CGRectMake (0, 0, [button.titleLabel.text dh_attributedSizeWithFont:button.titleLabel.font].width + 3, 24)];
    [button bk_addEventHandler:handler forControlEvents:UIControlEventTouchUpInside];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        [button setContentEdgeInsets:UIEdgeInsetsMake (0, xOffset, 0, -xOffset)];
    }

    UIBarButtonItem *customUIBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return customUIBarButtonItem;
}

@end
