//
//  NumberCheck.m
//  FizzBang
//
//  Created by Jeremy Frick on 6/24/15.
//  Copyright (c) 2015 Red Anchor Software. All rights reserved.
//

#import "NumberCheck.h"

@implementation NumberCheck
- (BOOL)stringIsNumeric:(NSString *)canidate {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *number = [formatter numberFromString:canidate];
    return !!number;
}
@end
