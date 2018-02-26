//
//  NSString+Validation.h
//  Spray Optimizer
//
//  Created by Daniel Carmo on 2015-08-17.
//  Copyright (c) 2015 SpeakFeel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)

- (BOOL)val_hasContent;
- (BOOL)val_isValidEmail;
- (BOOL)val_isValidPhoneNumber;

@end
