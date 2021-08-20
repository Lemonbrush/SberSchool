//
//  TestClass.m
//  Test
//
//  Created by 16817252 on 30.06.2021.
//

#import "TestClass.h"
#import "AppDelegate.h"

@interface TestClass ()

@end

@implementation TestClass

- (void)test {
	//Class delegateClass = [self.delegate class];
//	if ([delegateClass isKindOfClass:[NSString class]]) {
//
//	}
}
- (void)tetsMethod:(NSString *)string {
	AppDelegate *delegate = [AppDelegate new];
	AppDelegate *delegate2 = [[AppDelegate alloc] init];
	NSPersistentContainer *appDelegateNPersistentContainer = delegate.persistentContainer;
	[delegate saveContext];
	
	NSLog(@"%@", string);
	
}

- (void)tetsMethod:(NSString *)string withError:(NSError *)error { 
	NSLog(@"%@", string);
	NSLog(@"%@", error);
}

#pragma Category
- (void)testCategoryMethod {
	NSLog(@"category");
}



@end
