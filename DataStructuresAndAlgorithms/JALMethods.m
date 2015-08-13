//
//  JALMethods.m
//  DataStructuresAndAlgorithms
//
//  Created by Jason Lew on 8/13/15.
//  Copyright (c) 2015 Jason Lew. All rights reserved.
//

#import "JALMethods.h"

@implementation JALMethods

+ (BOOL)isPrime:(int)i {
    if (i < 2) {
        return false;
    }
    for (int j = 2; j*j <= i; j++) {
        if (i % j == 0) {
            return false;
        }
    }
    return true;
}

@end
