//
//  FizzBang.m
//  FizzBang
//
//  Created by Jeremy Frick on 6/24/15.
//  Copyright (c) 2015 Red Anchor Software. All rights reserved.
//

#import "FizzBang.h"

@implementation FizzBang

- (NSString*)process:(int)number {
    if (number % 15 == 0) {
        return @"FizzBang";
    } else if (number % 3 == 0) {
        return @"Fizz";
    } else if (number % 5 == 0) {
        return @"Bang";
    } else {
        return [NSString stringWithFormat:@"%d", number];
    }
}

@end
