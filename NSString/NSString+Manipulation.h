//
//  NSString+Manipulation.h
//  SelfTapeApp
//
//  Created by Daniel Carmo on 2015-10-07.
//  Copyright © 2015 SpeakFeel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Manipulation)

- (NSString *)man_removeAllSpaces;
- (NSString *)man_camelToUnderscore;
- (NSString *)man_MD5;
- (NSURL *)man_phoneURL;

@end
