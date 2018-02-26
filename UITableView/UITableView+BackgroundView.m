//
//  UITableView+BackgroundView.m
//  IMPACT
//
//  Created by Daniel Carmo on 2016-01-14.
//  Copyright © 2016 Jeffrey Sambells. All rights reserved.
//

#import "UITableView+BackgroundView.h"

@implementation UITableView (BackgroundView)

- (void)bgv_replaceTableViewWithLabel:(NSString *)text {
    UIView *backgroundView = [UIView new];
    backgroundView.frame = self.frame;
    backgroundView.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *label = [UILabel new];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = text;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.font = [UIFont boldSystemFontOfSize:22.0f];
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    
    [backgroundView addSubview:label];
    
    [backgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(20)-[label]-(20)-|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:NSDictionaryOfVariableBindings(label)]];
    
    [backgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(20)-[label]-(20)-|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:NSDictionaryOfVariableBindings(label)]];
    
    [self setBackgroundView:backgroundView];
}

@end
