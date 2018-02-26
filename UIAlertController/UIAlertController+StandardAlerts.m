//
//  UIAlertController+StandardAlerts.m
//  Spray Optimizer
//
//  Created by Daniel Carmo on 2015-09-11.
//  Copyright (c) 2015 SpeakFeel. All rights reserved.
//

#import "UIAlertController+StandardAlerts.h"

@implementation UIAlertController (StandardAlerts)

+ (UIAlertController *)sta_alertStyleControllerWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    return alertController;
}

+ (UIAlertController *)sta_okAlertStyleControllerWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController sta_alertStyleControllerWithTitle:title
                                                                                      message:message];
    
    [alertController sta_addCancelActionWithTitle:@"OK"
                                          handler:^(UIAlertAction *action) {
                                              [alertController dismissViewControllerAnimated:YES completion:nil];
                                          }];
    
    return alertController;
}

+ (UIAlertController *)sta_okAlertStyleControllerWithTitle:(NSString *)title message:(NSString *)message handler:(void (^)(UIAlertAction *action))handler {
    UIAlertController *alertController = [UIAlertController sta_alertStyleControllerWithTitle:title
                                                                                      message:message];
    
    [alertController sta_addCancelActionWithTitle:@"OK"
                                          handler:handler];
    
    return alertController;
}

+ (UIAlertController *)sta_yesNoAlertStyleControllerWithTitle:(NSString *)title message:(NSString *)message yesTitle:(NSString *)yesTitle noTitle:(NSString *)noTitle yesHandler:(void (^)(UIAlertAction * _Nonnull))yesHandler {
    UIAlertController *alertController = [UIAlertController sta_alertStyleControllerWithTitle:title message:message];
    
    [alertController sta_addDefaultActionWithTitle:yesTitle
                                           handler:yesHandler];
    
    [alertController sta_addCancelActionWithTitle:noTitle
                                          handler:^(UIAlertAction *action) {
                                              [alertController sta_dismiss];
                                          }];
    
    return alertController;
}

+ (UIAlertController *)sta_yesNoAlertStyleControllerWithTitle:(NSString *)title message:(NSString *)message yesTitle:(NSString *)yesTitle noTitle:(NSString *)noTitle yesHandler:(void (^)(UIAlertAction * _Nonnull))yesHandler noHandler:(void (^)(UIAlertAction * _Nonnull))noHandler  {
    UIAlertController *alertController = [UIAlertController sta_alertStyleControllerWithTitle:title message:message];
    
    [alertController sta_addDefaultActionWithTitle:yesTitle
                                           handler:yesHandler];
    
    [alertController sta_addCancelActionWithTitle:noTitle
                                          handler:noHandler];
    
    return alertController;
}

+ (UIAlertController *)sta_actionSheetStyleControllerWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    return alertController;
}

- (void)sta_addDefaultActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *))handler {
    [self sta_addActionWithTitle:title style:UIAlertActionStyleDefault handler:handler];
}

- (void)sta_addCancelActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *))handler {
    [self sta_addActionWithTitle:title style:UIAlertActionStyleCancel handler:handler];
}

- (void)sta_addDestructiveActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *))handler {
    [self sta_addActionWithTitle:title style:UIAlertActionStyleDestructive handler:handler];
}

- (void)sta_addActionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(UIAlertAction *action))handler {
    [self addAction:[UIAlertAction actionWithTitle:title style:style handler:handler]];
}

- (void)sta_show:(UIViewController *)viewController {
    [viewController presentViewController:self animated:YES completion:nil];
}

- (void)sta_dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
