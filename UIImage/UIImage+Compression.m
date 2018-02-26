//
//  UIImage+Compression.m
//  Pods
//
//  Created by Daniel Carmo on 2017-03-02.
//
//

#import "UIImage+Compression.h"

@implementation UIImage (Compression)

- (NSData *)pngData {
    return UIImagePNGRepresentation(self);
}

- (NSData *)jpegDataOfQuality:(CGFloat)quality {
    return UIImageJPEGRepresentation(self, quality);
}

- (UIImage *)scalingToWidth:(CGFloat)width {
    CGFloat imageScale = self.size.height / self.size.width;
    return [self scalingToSize:CGSizeMake(width, imageScale * width)];
}

- (UIImage *)scalingToHeight:(CGFloat)height {
    CGFloat imageScale = self.size.width / self.size.height;
    return [self scalingToSize:CGSizeMake(imageScale * height, height)];
}

- (UIImage *)scalingToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
