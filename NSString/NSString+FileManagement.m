//
//  NSString+FileManagement.m
//  SelfTapeApp
//
//  Created by Daniel Carmo on 2015-10-21.
//  Copyright © 2015 SpeakFeel. All rights reserved.
//

#import "NSString+FileManagement.h"

@implementation NSString (FileManagement)

#pragma mark - Public

- (NSString *)fmg_stringPathComponentByPrependingDocumentsDirectory {
    NSString *documentsDirectory = [NSString fmg_documentsDirectory];
    NSString *tempPath = [documentsDirectory stringByAppendingPathComponent:self];
    return tempPath;
}

- (NSString *)fmg_stringPathComponentByAddingTempFolder {
    BOOL isDirectory;
    [[NSFileManager defaultManager] fileExistsAtPath:self isDirectory:&isDirectory];
    if (isDirectory) {
        return [self stringByAppendingPathComponent:@"temp"];
    }
    
    NSRange range = [self rangeOfString:@"/" options:NSBackwardsSearch];
    NSString *path = [self substringToIndex:range.location];
    NSString *fileName = [self substringFromIndex:range.location];
    
    NSString *tempFilePath = [path stringByAppendingPathComponent:@"temp"];
    tempFilePath = [tempFilePath stringByAppendingPathComponent:fileName];
    
    return tempFilePath;
}

+ (NSString *)fmg_documentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

+ (NSString *)fmg_tempDirectory {
    return NSTemporaryDirectory();
}

+ (NSString *)fmg_tempDirectoryWithFileName:(NSString *)fileName {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
}

@end
