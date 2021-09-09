//
//  WSProxy1.m
//  内存管理01
//
//  Created by sws on 2021/9/8.
//

#import "WSProxy1.h"

@implementation WSProxy1

+ (instancetype)proxyWithTarget:(id)target{
    WSProxy1 *proxy = [[WSProxy1 alloc] init];
    proxy.target = target;
    return proxy;
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    return self.target;
}

//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
//
//}
//- (void)forwardInvocation:(NSInvocation *)anInvocation{
//
//}
@end
