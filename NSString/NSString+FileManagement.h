//
//  NSString+FileManagement.h
//  SelfTapeApp
//
//  Created by Daniel Carmo on 2015-10-21.
//  Copyright © 2015 SpeakFeel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FileManagement)

+ (NSString *)fmg_documentsDirectory;

/**
 * If the path contains a file name at the end then it will add it before that.
 * If the path is a directory it will just append the temp folder to the end
 */
- (NSString *)fmg_stringPathComponentByAddingTempFolder;
- (NSString *)fmg_stringPathComponentByPrependingDocumentsDirectory;

+ (NSString *)fmg_tempDirectory;
+ (NSString *)fmg_tempDirectoryWithFileName:(NSString *)fileName;

@end
