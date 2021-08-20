/*
AppDelegate.h
 Test

 bbnnmmekfkfkfkf
 bmbm
 vmvmmv


Created by 16817252 on 28.06.2021.
*/

#import <UIKit/UIKit.h>
#import "TestClass.h"
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong, nullable) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

