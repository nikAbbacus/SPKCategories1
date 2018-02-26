//
//  NSObject+Notifications.h
//  Pods
//
//  Created by Daniel Carmo on 2016-04-29.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (Notifications)

- (void)ntf_beginObserving:(NSString *)notificationName withAction:(SEL)selector;

- (void)ntf_endObserving:(NSString *)notificationName;
- (void)ntf_endAllObservers;

- (void)ntf_post:(NSString *)notificationName;
- (void)ntf_post:(NSString *)notificationName userInfo:(NSDictionary *)userInfo;

@end
