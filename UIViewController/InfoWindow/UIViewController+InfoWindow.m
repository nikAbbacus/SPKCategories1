//
//  UIViewController+InfoWindow.m
//  Spray Optimizer
//
//  Created by Daniel Carmo on 2015-08-10.
//  Copyright (c) 2015 SpeakFeel. All rights reserved.
//

#import "UIViewController+InfoWindow.h"
#import <BlocksKit/BlocksKit.h>

@implementation UIViewController (InfoWindow)

@dynamic infoWindowAttributedText;
@dynamic infoWindowText;
@dynamic infoWindow;

- (void)setInfoWindow:(InfoWindow *)infoWindow
{
    [self bk_associateValue:infoWindow withKey:@selector(infoWindow)];
}

- (InfoWindow *)infoWindow {
    InfoWindow *_infoWindow = (InfoWindow *)[self bk_associatedValueForKey:@selector(infoWindow)];
    if (!_infoWindow) {
        if (self.infoWindowAttributedText) {
            _infoWindow = [self createInfoWindowAttributedText:self.infoWindowAttributedText];
        }
        else {
            _infoWindow = [self createInfoWindowText:self.infoWindowText];
        }
        [self setInfoWindow:_infoWindow];
    }
    
    return _infoWindow;
}

- (void)setInfoWindowText:(NSString *)infoWindowText {
    [self bk_associateValue:infoWindowText withKey:@selector(infoWindowText)];
    if (!self.infoWindow) {
        [self setInfoWindow:[self createInfoWindowText:infoWindowText]];
    }
    else {
        self.infoWindow.text = infoWindowText;
    }
}

- (NSString *)infoWindowText {
    return [self bk_associatedValueForKey:@selector(infoWindowText)];
}

- (void)setInfoWindowAttributedText:(NSAttributedString *)infoWindowAttributedText {
    [self bk_associateValue:infoWindowAttributedText withKey:@selector(infoWindowAttributedText)];
    if (!self.infoWindow) {
        [self setInfoWindow:[self createInfoWindowAttributedText:infoWindowAttributedText]];
    }
    else {
        self.infoWindow.attributedText = infoWindowAttributedText;
    }
}

- (NSAttributedString *)infoWindowAttributedText {
    return [self bk_associatedValueForKey:@selector(infoWindowAttributedText)];
}

- (InfoWindow *)createInfoWindowText:(NSString *)infoText {
    InfoWindow *infoWindow = [InfoWindow new];
    infoWindow.text = infoText;
    return infoWindow;
}

- (InfoWindow *)createInfoWindowAttributedText:(NSAttributedString *)infoAttributedText {
    InfoWindow *infoWindow = [InfoWindow new];
    infoWindow.attributedText = infoAttributedText;
    return infoWindow;
}

-(void)addInfoWindowButtonToNav {
    if (![self.navigationItem.rightBarButtonItems containsObject:self.infoWindow.barButtonItem]) {
        self.navigationItem.rightBarButtonItems = [self.navigationItem.rightBarButtonItems arrayByAddingObject:self.infoWindow.barButtonItem];
    }
}

@end
