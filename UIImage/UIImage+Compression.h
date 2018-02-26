//
//  UIImage+Compression.h
//  Pods
//
//  Created by Daniel Carmo on 2017-03-02.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Compression)

- (NSData *)pngData;
- (NSData *)jpegDataOfQuality:(CGFloat)quality;

- (UIImage *)scalingToWidth:(CGFloat)width;
- (UIImage *)scalingToHeight:(CGFloat)height;
- (UIImage *)scalingToSize:(CGSize)newSize;

@end
