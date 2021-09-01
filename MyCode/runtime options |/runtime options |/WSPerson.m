//
//  WSPerson.m
//  runtime options |
//
//  Created by 16 Macbook Pro on 2021/9/1.
//

#import "WSPerson.h"
#import "WSCat.h"
#import <objc/runtime.h>
@implementation WSPerson


/// 动态解析阶段
//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel == @selector(test)) {
//        Method method = class_getInstanceMethod(self, @selector(other));
//        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
//    }
//    return [super resolveInstanceMethod:sel];
//}
//
//-(void)other{
//    NSLog(@"%s", __func__);
//}

/// 消息转发阶段
// 1.
//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    if (aSelector == @selector(test)) {
//        return  [[WSCat alloc] init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}
// 2.
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if (aSelector == @selector(test)) {
        return nil;
//        return [NSMethodSignature signatureWithObjCTypes:"V@:"];
    }
    return [super methodSignatureForSelector:aSelector];;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"你想干啥就干啥子");
}


- (void)doesNotRecognizeSelector:(SEL)aSelector{
    NSLog(@"要报错了，啥也不是");
}
@end
