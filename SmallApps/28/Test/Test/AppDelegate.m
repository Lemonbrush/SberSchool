//
//  AppDelegate.m
//  Test
//
//  Created by 16817252 on 28.06.2021.
//

#import "AppDelegate.h"

const NSString *var = @"Nika";

@interface AppDelegate ()

@property (strong, nullable) NSPersistentContainer *persistentContainer;
@property (readonly, strong, nullable) NSPersistentContainer *oldPersistentContainer;
- (void)myPrivateMethod;

@end


@implementation AppDelegate

- (void)myPrivateMethod {

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	//TestClass *myClass = [TestClass new];

	^{
		NSLog(@"Nika");
	}();

	void (^simpleBlock)(void);
	simpleBlock = ^{
		NSLog(@"Nika2");
	};
	simpleBlock();
/*
	BOOL var1 = YES;
	NSNumber *var2 = @YES;
	double var = 4.5;
	float vr3 = 3.5f;
	long double var4 = 3.6L;
*/
//
	NSString *string = @"nika";


	NSLog(@"nika"); //-> "nika"

	NSLog(@"nika %@", string); //-> "nika nikas"

	NSNumber *floatNumber = @(3.6f);
	float numberFloat = floatNumber.floatValue;
	NSNotFound
//	4/2 = 2
//	4.0/2 = 2.0
//	4/2.0 = 2.0
//	4.0/2.0 = 2.0

//	float var1
//	float var2
//
//	var1 == var2 НЕЛЬЗЯ
//
//	var1 - var2 < 0.0000000001


	//[myClass tetsMethod];

//	if ([myClass respondsToSelector:@selector(tetsMethod)]) {
//		[myClass tetsMethod];
//	}



	return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
	// Called when a new scene session is being created.
	// Use this method to select a configuration to create the new scene with.
	return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
	// Called when the user discards a scene session.
	// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
	// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Test"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

//- (void)saveContext {
//    NSManagedObjectContext *context = self.persistentContainer.viewContext;
//    NSError *error = nil;
//    if ([context hasChanges] && ![context save:&error]) {
//        // Replace this implementation with code to handle the error appropriately.
//        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//        abort();
//    }
//}

@end
