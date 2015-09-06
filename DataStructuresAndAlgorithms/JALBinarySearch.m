//
//  JALBinarySearch.m
//  DataStructuresAndAlgorithms
//
//  Created by Jason Lew on 8/13/15.
//  Copyright (c) 2015 Jason Lew. All rights reserved.
//

#import "JALBinarySearch.h"
#import "JALLog.h"

NSString *const kWasFoundKey = @"wasFoundKey";
NSString *const kIndexKey = @"indexKey";

@implementation JALBinarySearch

+ (NSDictionary *)findItemAndPosition:(id)key sortedArray:(NSArray *)sortedArray {
    // Check if the array is empty
    if (sortedArray.count == 0) return @{kWasFoundKey: @NO, kIndexKey: @0};
    
    int low = 0;
    int high = (int)[sortedArray count] - 1;
    int mid;
    
    // Check if the key can be compared
    if (![key respondsToSelector:@selector(compare:)]) { return nil; }
    
    while (low <= high) {
        // Get the index mid-point object and compare it to the key.
        mid = (low + high) / 2;
        NSComparisonResult result = [key compare:sortedArray[mid]];
        
        if (result == NSOrderedSame) {
            NSLog(@"Key equals %@", sortedArray[mid]);
            return @{kWasFoundKey: @YES, kIndexKey: [NSNumber numberWithInt:mid]};
        } else if (result == NSOrderedAscending) {
            high = mid - 1;
            NSLog(@"Key is less than %@", sortedArray[mid]);
        } else {
            low = mid + 1;
            NSLog(@"Key is greater than %@", sortedArray[mid]);
        }
    }
    
    // The item was not found.
    // Return the highest index at failure for insert function
    
    DLog(@"Key %@ not found, index is: %d", key, MAX(low, high));
    return @{kWasFoundKey: @NO, kIndexKey: [NSNumber numberWithInt:MAX(low, high)]};
}

+ (BOOL)findItem:(id)key sortedArray:(NSArray *)sortedArray {
    NSDictionary *resultDict = [self findItemAndPosition:key sortedArray:sortedArray];
    BOOL wasFound = ![resultDict[kWasFoundKey] isEqual: @NO];
    DLog(@"Key %@ was found: %@", key, wasFound ? @"Yes" : @"No");
    return wasFound;
}

+ (void)insertItem:(id)item sortedMutableArray:(NSMutableArray **)sortedMutableArray {
    int index = [[self findItemAndPosition:item sortedArray:*sortedMutableArray][kIndexKey]intValue];
    [*sortedMutableArray insertObject:item atIndex:index];
}

@end
