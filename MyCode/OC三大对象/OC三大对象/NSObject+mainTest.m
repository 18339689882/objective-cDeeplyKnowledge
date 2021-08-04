//
//  NSObject+mainTest.m
//  OC三大对象
//
//  Created by sws on 2021/8/3.
//

#import "NSObject+mainTest.h"

@implementation NSObject (mainTest)

//+ (void)test{
//    NSLog(@"+ [NSObject categary] %@", self);
//}

- (void)test{
    NSLog(@"- [NSObject categary] %@", self); /// self 谁发来的消息，打印谁。
}

@end
