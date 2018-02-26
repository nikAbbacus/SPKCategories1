//
//  NSIndexPath+Addition.h
//  DMCInlinePickerTableView
//
//  Created by Daniel Carmo on 2015-08-25.
//  Copyright (c) 2015 daniel carmo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define iPath(row, section) [NSIndexPath indexPathForRow:row inSection:section]

@interface NSIndexPath (Addition)

- (NSIndexPath *)ipa_nextRow;
- (NSIndexPath *)ipa_previousRow;

- (NSIndexPath *)ipa_rowPlus:(NSInteger)addToRow;
- (NSIndexPath *)ipa_sectionPlus:(NSInteger)addToSection;
- (NSIndexPath *)ipa_rowPlus:(NSInteger)addToRow sectionPlus:(NSInteger)addToSection;

@end
