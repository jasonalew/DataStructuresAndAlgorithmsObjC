//
//  JALBinarySearch.h
//  DataStructuresAndAlgorithms
//
//  Created by Jason Lew on 8/13/15.
//  Copyright (c) 2015 Jason Lew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JALBinarySearch : NSObject

+ (NSDictionary *)findItemAndPosition:(id)key sortedArray:(NSArray *)sortedArray;

+ (BOOL)findItem:(id)key sortedArray:(NSArray *)sortedArray;

+ (void)insertItem:(id)item sortedMutableArray:(NSMutableArray **)sortedMutableArray;

@end
