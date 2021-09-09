//
//  WSProxy.m
//  内存管理01
//
//  Created by sws on 2021/9/8.
//

#import "WSProxy.h"

@implementation WSProxy

+ (instancetype)proxyWithTarget:(id)target{
    WSProxy *proxy = [WSProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:self.target];
}
/// 没有此方法
//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    return self.target;
//}


@end
