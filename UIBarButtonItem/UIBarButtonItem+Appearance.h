//
//  UIBarButtonItem+Appearance.h
//  Gideons
//
//  Created by Jeffrey Sambells on 2015-07-17.
//  Copyright (c) 2015 Iversoft Solutions Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <libextobjc/EXTScope.h>

@interface UIBarButtonItem (Appearance)

+ (UIBarButtonItem *)appearance_barItemWithTemplateImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage xOffset:(NSInteger)xOffset handler:(void (^)(id sender))handler;
+ (UIBarButtonItem *)appearance_barItemWithOriginalImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage xOffset:(NSInteger)xOffset handler:(void (^)(id sender))handler;
+ (UIBarButtonItem *)appearance_barItemWithTitle:(NSString *)title xOffset:(NSInteger)xOffset handler:(void (^)(id sender))handler;

@end
