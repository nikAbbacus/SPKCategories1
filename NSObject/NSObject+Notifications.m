//
//  NSObject+Notifications.m
//  Pods
//
//  Created by Daniel Carmo on 2016-04-29.
//
//

#import "NSObject+Notifications.h"

@implementation NSObject (Notifications)

- (void)ntf_beginObserving:(NSString *)notificationName withAction:(SEL)selector {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:selector
                                                 name:notificationName
                                               object:nil];
}

- (void)ntf_endObserving:(NSString *)notificationName {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:notificationName
                                                  object:nil];
}

- (void)ntf_endAllObservers {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)ntf_post:(NSString *)notificationName {
    [self ntf_post:notificationName
          userInfo:nil];
}

- (void)ntf_post:(NSString *)notificationName userInfo:(NSDictionary *)userInfo {
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName
                                                        object:self
                                                      userInfo:userInfo];
}

@end
