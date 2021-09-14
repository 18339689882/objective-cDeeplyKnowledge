//
//  main.m
//  内存管理01
//
//  Created by sws on 2021/9/8.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "WSProxy.h"
#import "WSProxy1.h"
#import "ViewController.h"

BOOL isTargetPointer(id pointer){
    return (long)(__bridge void *)pointer & 1;
}

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
//        ViewController *vc = [[ViewController alloc] init];
//        WSProxy *proxy = [WSProxy proxyWithTarget:vc];
//        WSProxy1 *proxy1 = [WSProxy1 proxyWithTarget:vc];
//
//        NSLog(@"%d", [proxy isKindOfClass:[ViewController class]]);// 1
//        NSLog(@"%d", [proxy1 isKindOfClass:[ViewController class]]);// 左边对象是否右边对象类型，或者右边类型的子类 // 0
//
//        NSString *str1 = @"123";
//        NSString *str2 = @"123";
//        NSString *str3 = @"456";
//        NSLog(@"%p , %p, %p", str1, str2, str3);
#pragma mark
#pragma mark targetPoint
#pragma mark
        
        /**
         一些小对象的存储 tagged pointer
         */
        NSNumber *number = @4;
        NSNumber *number1 = @5;
        NSNumber *number2 = @6;
        
        NSLog(@"%p,%p, %p", number, number1, number2);
        NSLog(@"%d %d, %d", isTargetPointer(number), isTargetPointer(number1), isTargetPointer(number2));
        NSLog(@"%@ %@, %@", [number class], [number1 class], [number2 class]);
        
        NSString *str = [NSString stringWithFormat:@"123"];
        NSString *str1 = [NSString stringWithFormat:@"aefasfasdfasfdasf"];
        NSLog(@"%p %p", str, str1);
        NSLog(@"%@  %@",[str class],[str1 class]);


        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
