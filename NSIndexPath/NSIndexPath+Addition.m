//
//  NSIndexPath+Addition.m
//  DMCInlinePickerTableView
//
//  Created by Daniel Carmo on 2015-08-25.
//  Copyright (c) 2015 daniel carmo. All rights reserved.
//

#import "NSIndexPath+Addition.h"

@implementation NSIndexPath (Addition)

- (NSIndexPath *)ipa_nextRow {
    return [self ipa_rowPlus:1 sectionPlus:0];
}

- (NSIndexPath *)ipa_previousRow {
    return [self ipa_rowPlus:-1 sectionPlus:0];
}

- (NSIndexPath *)ipa_rowPlus:(NSInteger)addToRow {
    return [self ipa_rowPlus:addToRow sectionPlus:0];
}

- (NSIndexPath *)ipa_sectionPlus:(NSInteger)addToSection {
    return [self ipa_rowPlus:0 sectionPlus:addToSection];
}

- (NSIndexPath *)ipa_rowPlus:(NSInteger)addToRow sectionPlus:(NSInteger)addToSection {
    return iPath(self.row + addToRow, self.section + addToSection);
}

@end
