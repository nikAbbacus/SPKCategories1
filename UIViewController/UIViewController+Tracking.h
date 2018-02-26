//
//  UIViewController+Tracking.h
//  FlagMyField
//
//  Created by Nikhil Thiruvengadam on 2016-06-21.
//  Copyright © 2016 AgNition Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GAI.h"

@interface UIViewController (Tracking)

- (id<GAITracker>)gai_tracker;

- (void)gai_sendScreenView:(NSString *)screenName;

- (void)gai_sendEventWithCategory:(NSString *)category;
- (void)gai_sendEventWithCategory:(NSString *)category action:(NSString *)action;
- (void)gai_sendEventWithCategory:(NSString *)category action:(NSString *)action label:(NSString *)label;
- (void)gai_sendEventWithCategory:(NSString *)category action:(NSString *)action label:(NSString *)label value:(NSNumber *)value;

@end
