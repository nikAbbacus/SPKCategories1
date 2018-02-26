//
//  UIAlertController+StandardAlerts.h
//  Spray Optimizer
//
//  Created by Daniel Carmo on 2015-09-11.
//  Copyright (c) 2015 SpeakFeel. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (StandardAlerts)

/**
 * Make an Alert.
 */
+ (UIAlertController *)sta_alertStyleControllerWithTitle:(NSString *)title message:(NSString *)message;

/**
 * Make an Alert as an information popup with an OK button for the user to continue.
 */
+ (UIAlertController *)sta_okAlertStyleControllerWithTitle:(NSString *)title message:(NSString *)message;

/**
 *  Make an Alert as an information popup with an OK button for the user to continue. Using a Handler to handle the OK click
 *
 *  @param title   Title of the pop up to show
 *  @param message Message of the pop up to show
 *  @param handler Handle the click of the OK button
 *
 *  @return Returns a dialog to show
 */
+ (UIAlertController *)sta_okAlertStyleControllerWithTitle:(NSString *)title message:(NSString *)message handler:(void (^)(UIAlertAction *action))handler;

/**
 * Make an Alert with yes and no as options. No is defaulted to just closing the window
 */
+ (UIAlertController *)sta_yesNoAlertStyleControllerWithTitle:(NSString *)title message:(NSString *)message yesTitle:(NSString *)yesTitle noTitle:(NSString *)noTitle yesHandler:(void (^)(UIAlertAction *action))yesHandler;
/**
 * Make an Alert with yes and no as options
 */
+ (UIAlertController *)sta_yesNoAlertStyleControllerWithTitle:(NSString *)title message:(NSString *)message yesTitle:(NSString *)yesTitle noTitle:(NSString *)noTitle yesHandler:(void (^)(UIAlertAction *action))yesHandler noHandler:(void (^)(UIAlertAction *action))noHandler;

+ (UIAlertController *)sta_actionSheetStyleControllerWithTitle:(NSString *)title message:(NSString *)message;

- (void)sta_addDefaultActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;
- (void)sta_addCancelActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;
- (void)sta_addDestructiveActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;
- (void)sta_addActionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(UIAlertAction *action))handler;

/**
 * Shows the alert in the given view controller with animate YES.
 */
- (void)sta_show:(nonnull UIViewController *)viewController;
/**
 * Dismisses the alert controller with animate YES.
 */
- (void)sta_dismiss;

@end

NS_ASSUME_NONNULL_END
