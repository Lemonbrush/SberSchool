//
//  ViewController.m
//  Test
//
//  Created by 16817252 on 28.06.2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (ViewController *)initWithColor:(UIColor *)color {
	[super viewDidLoad];
	if (self) {

	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)testWithParans:(NSString *)param1 {
	//bla-bla
}

- (void)testWithParans:(NSString *)param1 param2:(NSNumber *)param2 {
	//bla-bla

	// @selector(testWithParans:param2:)
}




- (void)test {
	ViewController *controller = [ViewController new];
	ViewController *controller2 = [[ViewController alloc] init];
	UIColor *color = UIColor.blackColor;
	ViewController *controller3 = [[ViewController alloc] initWithColor:color];

	[controller testWithParans:@"nika"];

	[controller testWithParans:@"nika" param2:@3];

	NSInteger index = 1;
	NSUInteger index2 = -11;
}





@end
