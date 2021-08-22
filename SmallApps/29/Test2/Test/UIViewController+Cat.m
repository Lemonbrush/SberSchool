//
//  UIViewController+Cat.m
//  Test
//
//  Created by 16817252 on 20.08.2021.
//

#import "UIViewController+Cat.h"

@implementation UIViewController (Cat)

- (instancetype)initParams:(NSInteger) count {
	self = [super init];
	if (self) {
		NSLog(@"%@", @(count));

	}

	return self;
}

@end
