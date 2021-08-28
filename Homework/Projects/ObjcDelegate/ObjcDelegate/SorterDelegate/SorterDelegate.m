//
//  SorterDelegate.m
//  ObjcDelegate
//
//  Created by Alexander Rubtsov on 28.08.2021.
//

#import "SorterDelegate.h"

@implementation SorterDelegate

- (NSArray *) sortByName: (NSString *) word withArrayOf: (NSArray *) words {
    
    NSRange myRange = NSMakeRange(0, 1);
    NSString *letter = [word substringWithRange:myRange]; //A
    
    NSArray *sortedArray = [words sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        int obj1Letters = [[obj1 componentsSeparatedByString:letter] count] - 1;
        int obj2Letters = [[obj2 componentsSeparatedByString:letter] count] - 1;
        
        if (obj1Letters < obj2Letters) {
            return  NSOrderedAscending; // <
        } else if (obj1Letters > obj2Letters) {
            return NSOrderedDescending; // >
        } else {
            return NSOrderedSame; // Equal
        }
    }];
    
    return sortedArray;
}

@end
