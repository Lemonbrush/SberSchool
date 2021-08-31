//
//  ObjectiveCViewController.m
//  interop
//
//  Created by Alexander Rubtsov on 25.08.2021.
//

#import "ObjCObject.h"
#import "interop-Swift.h"

@implementation ObjCObject

+ (void) printSuccessMessage: (NSString* ) string {
    NSLog(@"%@", string);
    
   //CustomeViewController <- This part is recognized by compiler
}

@end
