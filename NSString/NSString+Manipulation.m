//
//  NSString+Manipulation.m
//  SelfTapeApp
//
//  Created by Daniel Carmo on 2015-10-07.
//  Copyright © 2015 SpeakFeel. All rights reserved.
//

#import "NSString+Manipulation.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Manipulation)

- (NSString *)man_removeAllSpaces {
    NSArray *splitStringsOnSpace = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *removedSpacesString = [splitStringsOnSpace componentsJoinedByString:@""];
    
    return removedSpacesString;
}

- (NSString *)man_camelToUnderscore
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    scanner.charactersToBeSkipped = NULL;
    NSString *tempText = nil;
    NSMutableString *converted = [NSMutableString new];
    while (![scanner isAtEnd]) {
        [scanner scanUpToCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"] intoString:&tempText];
        
        if (tempText != nil) {
            [converted appendString:[tempText lowercaseString]];
            if (![scanner isAtEnd]) {
                [converted appendString:@"_"];
            }
        }
        if (![scanner isAtEnd]) {
            NSString *letter = [self substringWithRange:NSMakeRange (scanner.scanLocation, 1)];
            [converted appendString:[letter lowercaseString]];
            
            [scanner setScanLocation:[scanner scanLocation] + 1];
        }
        
        tempText = nil;
    }
    return converted;
}

- (NSString *)man_MD5 {
    const char *str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x", result[i]];
    }
    return ret;
}

- (NSURL *)man_phoneURL {
    NSError *regexError = nil;
    NSRegularExpression *phoneRegex = [NSRegularExpression regularExpressionWithPattern:@"[^0-9.]"
                                                                                options:0
                                                                                  error:&regexError];
    
    NSMutableString *tel1 = [self mutableCopy];
    [phoneRegex replaceMatchesInString:tel1
                               options:0
                                 range:NSMakeRange(0, [tel1 length])
                          withTemplate:@""];
    
    return [NSURL URLWithString:[NSString stringWithFormat:@"tel:+%@", tel1]];
}

@end
