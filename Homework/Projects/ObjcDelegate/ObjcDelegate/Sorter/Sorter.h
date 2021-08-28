//
//  Sorter.h
//  ObjcDelegate
//
//  Created by Alexander Rubtsov on 28.08.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Sorter;
@protocol SorterDelegate <NSObject>
- (NSArray *) sortByName: (NSString *) word withArrayOf: (NSArray *) words;
@end

@interface Sorter : NSObject {
}
@property (nonatomic, weak) id <SorterDelegate> delegate; //define MyClassDelegate as delegate
- (void) sortByName: (NSString *) word withArrayOf: (NSArray *) words;
@end

NS_ASSUME_NONNULL_END
