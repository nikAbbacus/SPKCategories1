//
//  NSArray+Mutation.h
//  Spray Optimizer
//
//  Created by Daniel Carmo on 2015-08-27.
//  Copyright (c) 2015 SpeakFeel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Mutation)

- (NSArray *)mut_arrayByMovingObjectAtIndex:(NSInteger)originalIndex toIndex:(NSInteger)newIndex;
- (NSArray *)mut_arrayByAddingObjectToStart:(id)object;
- (NSArray *)mut_arrayByRemovingObject:(id)object;

@end
