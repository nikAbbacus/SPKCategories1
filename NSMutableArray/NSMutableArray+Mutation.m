//
//  NSMutableArray+Mutation.m
//  Spray Optimizer
//
//  Created by Daniel Carmo on 2015-08-27.
//  Copyright (c) 2015 SpeakFeel. All rights reserved.
//

#import "NSMutableArray+Mutation.h"

@implementation NSMutableArray (Mutation)

- (NSArray *)mut_immutableCopy {
    return [NSArray arrayWithArray:self];
}

- (NSMutableArray *)mut_mutableArrayByMovingObjectAtIndex:(NSInteger)originalIndex toIndex:(NSInteger)newIndex {
    id objToMove = self[(NSUInteger)originalIndex];
    [self removeObject:objToMove];
    [self insertObject:objToMove atIndex:(NSUInteger)newIndex];
    return self;
}

@end
