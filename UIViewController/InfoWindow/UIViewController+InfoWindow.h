//
//  UIViewController+InfoWindow.h
//  Spray Optimizer
//
//  Created by Daniel Carmo on 2015-08-10.
//  Copyright (c) 2015 SpeakFeel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoWindow.h"

@interface UIViewController (InfoWindow)

@property (strong, nonatomic) NSString *infoWindowText;
@property (strong, nonatomic) NSAttributedString *infoWindowAttributedText;
@property (strong, nonatomic) InfoWindow *infoWindow;

- (void)addInfoWindowButtonToNav;

@end
