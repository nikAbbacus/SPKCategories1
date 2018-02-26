//
//  NSMutableArray+Mutation.h
//  Spray Optimizer
//
//  Created by Daniel Carmo on 2015-08-27.
//  Copyright (c) 2015 SpeakFeel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Mutation)

- (NSArray *)mut_immutableCopy;

- (NSMutableArray *)mut_mutableArrayByMovingObjectAtIndex:(NSInteger)originalIndex toIndex:(NSInteger)newIndex;

@end
