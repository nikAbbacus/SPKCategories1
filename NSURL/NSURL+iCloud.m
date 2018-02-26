//
//  NSURL+iCloud.m
//  SelfTapeApp
//
//  Created by Daniel Carmo on 2015-10-21.
//  Copyright © 2015 SpeakFeel. All rights reserved.
//

#import "NSURL+iCloud.h"

@implementation NSURL (iCloud)

- (BOOL)cld_excludeFromBackup {
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self path]]) {
        
        NSError *error = nil;
        BOOL success = [self setResourceValue:[NSNumber numberWithBool:YES]
                                      forKey:NSURLIsExcludedFromBackupKey
                                       error:&error];
        if (!success) {
            NSLog(@"Failed to exclude %@ with error %@", self, error);
        }
        
        return success;
    }
    else {
        NSLog(@"Failed to exclude file doesn't exist!");
        return NO;
    }
}

@end
