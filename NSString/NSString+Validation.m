//
//  NSString+Validation.m
//  Spray Optimizer
//
//  Created by Daniel Carmo on 2015-08-17.
//  Copyright (c) 2015 SpeakFeel. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

- (BOOL)val_hasContent {
    return self != nil && ![[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""];
}

- (BOOL)val_isValidEmail {
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)val_isValidPhoneNumber {
    NSString *phoneNumberRegex = @"^[0-9]{3}\\s[0-9]{3}-[0-9]{4}$";
    NSPredicate *phoneNumberText = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneNumberRegex];
    return [phoneNumberText evaluateWithObject:self];
}

@end
