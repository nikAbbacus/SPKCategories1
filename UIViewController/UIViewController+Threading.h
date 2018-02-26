//
//  UIViewController+Threading.h
//  SelfTapeApp
//
//  Created by Daniel Carmo on 2015-11-10.
//  Copyright © 2015 SpeakFeel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Threading)

+ (void)thr_runOnUiThread:(void (^)())block;
// Delay in seconds
+ (void)thr_runOnUiThread:(void (^)())block afterDelay:(NSTimeInterval)delay;
+ (void)thr_runAsyncOnGlobalDefaultThread:(void (^)())block;

@end
