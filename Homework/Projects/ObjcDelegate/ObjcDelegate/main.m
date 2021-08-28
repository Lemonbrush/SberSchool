//
//  main.m
//  ObjcDelegate
//
//  Created by Alexander Rubtsov on 28.08.2021.
//

#import <Foundation/Foundation.h>
#import "Sorter.h"
#import "SorterDelegate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *words = @[ @"alanbaraban",
                            @"asiat",
                            @"petrovich",
                            @"ekaterina",
                            @"olga",
                            @"arsenius",
                            @"avianius"];
        
        Sorter *sorter = [[Sorter alloc] init];
        SorterDelegate *sorterDelegate = [[SorterDelegate alloc] init];
        
        sorter.delegate = sorterDelegate;
        
        [sorter sortByName: @"alexander" withArrayOf: words];
    }
    return 0;
}
