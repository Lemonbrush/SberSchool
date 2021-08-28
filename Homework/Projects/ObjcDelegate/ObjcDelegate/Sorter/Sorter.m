//
//  Sorter.m
//  ObjcDelegate
//
//  Created by Alexander Rubtsov on 28.08.2021.
//

#import "Sorter.h"

@implementation Sorter
@synthesize delegate;

- (void) sortByName: (NSString *) word withArrayOf: (NSArray *) words {
   NSLog(@"%@", [self.delegate sortByName: word withArrayOf: words]);
}

@end
