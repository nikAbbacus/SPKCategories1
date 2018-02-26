//
//  NSArray+Lambda.m
//  Pods
//
//  Created by Daniel Carmo on 2017-03-02.
//
//

#import "NSArray+Lambda.h"

@implementation NSArray (Lambda)

- (NSArray *)where:(BOOL (^)(id obj))whereClause {
    NSMutableArray *newArray = [NSMutableArray new];
    for (id element in self) {
        if (whereClause(element)) {
            [newArray addObject:element];
        }
    }
    return newArray;
}

- (NSUInteger)countWhere:(BOOL (^)(id obj))whereClause {
    NSUInteger count = 0;
    for (id element in self) {
        if (whereClause(element)) {
            count++;
        }
    }
    return count;
}

- (void)forEach:(void (^)(id))operation {
    for (id obj in self) {
        operation(obj);
    }
}

@end
