//
//  InfoWindow.m
//  Spray Optimizer
//
//  Created by Daniel Carmo on 2015-07-21.
//  Copyright (c) 2015 SpeakFeel. All rights reserved.
//

#import "InfoWindow.h"
#import "UITraitCollection+Extensions.h"
#import "UIBarButtonItem+Appearance.h"

#define INFO_WINDOW_TEXT_VIEW_WIDTH 280.0f

@interface InfoWindow()

@property (strong, nonatomic, readwrite) UIBarButtonItem *barButtonItem;

@property (strong, nonatomic) UITextView *infoTextView;

@property (strong, nonatomic) NSLayoutConstraint *infoWindowTrailingEdgeConstraint;

@end

@implementation InfoWindow

- (void)awakeFromNib {
    [self setUp];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setUp];
    }
    
    return self;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    InfoWindow *copyInfoWindow = [[[self class] allocWithZone:zone] init];
    copyInfoWindow.text = [self.text copyWithZone:zone];
    copyInfoWindow.attributedText = [self.attributedText copyWithZone:zone];
    copyInfoWindow.barButtonItem = self.barButtonItem;
    copyInfoWindow.infoTextView = self.infoTextView;
    copyInfoWindow.infoWindowTrailingEdgeConstraint = self.infoWindowTrailingEdgeConstraint;
    
    return copyInfoWindow;
}

#pragma mark - Overrides

#pragma mark - Properties

- (UIBarButtonItem *)barButtonItem {
    if (!_barButtonItem) {
        __weak InfoWindow *weakSelf = self;
        _barButtonItem = [UIBarButtonItem appearance_barItemWithTemplateImage:[UIImage imageNamed:@"ic_help"]
                                                             highlightedImage:nil
                                                                      xOffset:0
                                                                      handler:^(id sender) {
                                                                          [weakSelf toggle:weakSelf.barButtonItem];
                                                                      }];
        // TODO: Fix this when bug with icons is fixed
        /*_barButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_help"]
                                                          style:UIBarButtonItemStylePlain
                                                         target:self
                                                         action:@selector(toggle:)];*/
    }
    
    return _barButtonItem;
}

- (void)setText:(NSString *)text {
    _text = text;
    _attributedText = nil;
    self.infoTextView.attributedText = _attributedText;
    self.infoTextView.text = _text;
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    _attributedText = attributedText;
    _text = nil;
    self.infoTextView.text = _text;
    self.infoTextView.attributedText = _attributedText;
}

#pragma mark - Methods

- (void)addToView:(UIView *)view {
    [view addSubview:self];
    [view bringSubviewToFront:self];
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(0)-[infoWindow]-(0)-|"
                                                                 options:NSLayoutFormatAlignAllBottom
                                                                 metrics:nil
                                                                   views:@{
                                                                           @"infoWindow": self
                                                                           }]];
    
    if ([self.traitCollection isHCompactVCompact]) {
        [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[infoWindow]-(0)-|"
                                                                     options:NSLayoutFormatAlignAllBottom
                                                                     metrics:nil
                                                                       views:@{
                                                                               @"infoWindow": self
                                                                               }]];
    }
    else {
        [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(20)-[infoWindow]-(0)-|"
                                                                     options:NSLayoutFormatAlignAllBottom
                                                                     metrics:nil
                                                                       views:@{
                                                                               @"infoWindow": self
                                                                               }]];
    }
    
    [view layoutIfNeeded];
}

- (void)open {
    [self addToView:[[UIApplication sharedApplication] keyWindow]];
    
    self.hidden = NO;
    self.infoWindowTrailingEdgeConstraint.constant = 0;
    
    [UIView animateWithDuration:0.85
                     animations:^{
                         self.alpha = 1.0f;
                         [self layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

- (void)close {
    self.infoWindowTrailingEdgeConstraint.constant = INFO_WINDOW_TEXT_VIEW_WIDTH;
    
    [UIView animateWithDuration:0.85
                     animations:^{
                         self.alpha = 0.0f;
                         [self layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

#pragma mark - Helpers

- (void)toggle:(UIBarButtonItem *)sender {
    if (self.alpha > 0.0f) {
        [self close];
    }
    else {
        [self open];
    }
}

- (void)setUp {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.55f];
    self.alpha = 0.0f;
    
    self.infoTextView = [[UITextView alloc] init];
    self.infoTextView.editable = NO;
    self.infoTextView.font = [UIFont systemFontOfSize:18.0f];
    self.infoTextView.text = @"SAMPLE TEXT";
    
    self.infoTextView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.infoTextView];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[infoTextView(infoWidth)]"
                                                                 options:NSLayoutFormatAlignAllBaseline
                                                                 metrics:@{
                                                                           @"infoWidth": @(INFO_WINDOW_TEXT_VIEW_WIDTH)
                                                                           }
                                                                   views:@{
                                                                           @"infoTextView": self.infoTextView
                                                                           }]];
    
    // Need this constraint for animating so add it out here
    self.infoWindowTrailingEdgeConstraint = [NSLayoutConstraint constraintWithItem:self.infoTextView
                                                                        attribute:NSLayoutAttributeTrailing
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeTrailing
                                                                       multiplier:1.0f
                                                                         constant:(INFO_WINDOW_TEXT_VIEW_WIDTH)];
    
    [self addConstraint:self.infoWindowTrailingEdgeConstraint];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[infoTextView]-(0)-|"
                                                                 options:NSLayoutFormatAlignAllBaseline
                                                                 metrics:nil
                                                                   views:@{
                                                                           @"infoTextView": self.infoTextView
                                                                           }]];
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapView:)]];
}

- (void)prepareForInterfaceBuilder {
    [self setUp];
}

- (void)didTapView:(UITapGestureRecognizer *)gesture {
    [self close];
}


@end
