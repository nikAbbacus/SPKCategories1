//
//  UIViewController+Tracking.m
//  FlagMyField
//
//  Created by Nikhil Thiruvengadam on 2016-06-21.
//  Copyright © 2016 AgNition Inc. All rights reserved.
//

#import "UIViewController+Tracking.h"
#import <GAIDictionaryBuilder.h>
#import "GAIFields.h"

@implementation UIViewController (Tracking)

- (id<GAITracker>)gai_tracker {
    return [[GAI sharedInstance] defaultTracker];
}

- (void)gai_sendEventWithCategory:(NSString *)category {
    [self gai_sendEventWithCategory:category action:nil label:nil value:nil];
}

- (void)gai_sendEventWithCategory:(NSString *)category action:(NSString *)action {
    [self gai_sendEventWithCategory:category action:action label:nil value:nil];
}

- (void)gai_sendEventWithCategory:(NSString *)category action:(NSString *)action label:(NSString *)label {
    [self gai_sendEventWithCategory:category action:nil label:label value:nil];
}

- (void)gai_sendEventWithCategory:(NSString *)category action:(NSString *)action label:(NSString *)label value:(NSNumber *)value {
    [[self gai_tracker] send:[[GAIDictionaryBuilder createEventWithCategory:category
                                                                     action:action
                                                                      label:label
                                                                      value:value] build]];
}

- (void)gai_sendScreenView:(NSString *)screenName {
    [[self gai_tracker] set:kGAIScreenName value:screenName];
    [[self gai_tracker] send:[[GAIDictionaryBuilder createScreenView] build]];
}

@end
