//
//  UIViewController+Threading.m
//  SelfTapeApp
//
//  Created by Daniel Carmo on 2015-11-10.
//  Copyright © 2015 SpeakFeel. All rights reserved.
//

#import "UIViewController+Threading.h"

@implementation UIViewController (Threading)

+ (void)thr_runOnUiThread:(void (^)())block {
    dispatch_async(dispatch_get_main_queue(), block);
}

+ (void)thr_runOnUiThread:(void (^)())block afterDelay:(NSTimeInterval)delay {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
}

+ (void)thr_runAsyncOnGlobalDefaultThread:(void (^)())block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

@end
