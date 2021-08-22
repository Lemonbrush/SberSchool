//
//  SceneDelegate.h
//  Test
//
//  Created by 16817252 on 28.06.2021.
//

#import <UIKit/UIKit.h>
#import "TestProtocol.h"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow * window;
@property (weak, nonatomic) id<TestProtocol> delegate;


@end

