//
//  TestProtocol.h
//  Test
//
//  Created by 16817252 on 30.06.2021.
//

@protocol TestProtocol <NSObject>

- (void)tetsMethod:(NSString *)string;
- (void)tetsMethod:(NSString *)string withError:(NSError *)error;

@optional

- (void)tetsMethod;

//@required
//- (void)tetsMethod:(NSString *)string withError:(NSError *)error;

@end
