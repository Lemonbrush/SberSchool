//
//  TestClass.h
//  Test
//
//  Created by 16817252 on 30.06.2021.
//

#import <Foundation/Foundation.h>
#import "TestProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef struct {
	char *code;
	char *name;
} SODemoCurrency;


@interface TestClass : NSObject <TestProtocol>

//@property id<TestProtocol> delegate;
//@property id<CoreDataServiceProtocol> coreDataService;
//@property id<NetworServiceProtocol> networService;
@property SODemoCurrency currency;

- (void)mainMethod;

@end

@interface TestClass (Category3)

@property NSString *myName;
@property NSString* myLastName;

@end

@interface TestClass (Category2)

@property SODemoCurrency currency2;

- (void)testCategoryMethod2;

@end

NS_ASSUME_NONNULL_END
