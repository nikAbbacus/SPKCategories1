//
//  NSArray+Lambda.h
//  Pods
//
//  Created by Daniel Carmo on 2017-03-02.
//
//

#import <Foundation/Foundation.h>

@interface NSArray<ArrayType> (Lambda)

- (NSArray<ArrayType> *)where:(BOOL (^)(ArrayType obj))whereClause;
- (NSUInteger)countWhere:(BOOL (^)(id obj))whereClause;

- (void)forEach:(void (^)(ArrayType obj))operation;

@end
