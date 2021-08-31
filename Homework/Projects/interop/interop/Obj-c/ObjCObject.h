//
//  ObjectiveCViewController.h
//  interop
//
//  Created by Alexander Rubtsov on 25.08.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjCObject : NSObject
+ (void) printSuccessMessage: (NSString* ) string;
@end

NS_ASSUME_NONNULL_END
