//
//  NSArray+Mutation.m
//  Spray Optimizer
//
//  Created by Daniel Carmo on 2015-08-27.
//  Copyright (c) 2015 SpeakFeel. All rights reserved.
//

#import "NSArray+Mutation.h"
#import "NSMutableArray+Mutation.h"

@implementation NSArray (Mutation)

- (NSArray *)mut_arrayByMovingObjectAtIndex:(NSInteger)originalIndex toIndex:(NSInteger)newIndex {
    NSMutableArray *mutableSelf = [self mutableCopy];
    id objToMove = mutableSelf[(NSUInteger)originalIndex];
    [mutableSelf removeObject:objToMove];
    [mutableSelf insertObject:objToMove atIndex:(NSUInteger)newIndex];
    return [mutableSelf mut_immutableCopy];
}

- (NSArray *)mut_arrayByAddingObjectToStart:(id)object {
    NSMutableArray *mutableSelf = [self mutableCopy];
    [mutableSelf insertObject:object atIndex:0];
    return [mutableSelf mut_immutableCopy];
}

- (NSArray *)mut_arrayByRemovingObject:(id)object {
    NSMutableArray *mutableSelf = [self mutableCopy];
    [mutableSelf removeObject:object];
    return [mutableSelf mut_immutableCopy];
}

@end
