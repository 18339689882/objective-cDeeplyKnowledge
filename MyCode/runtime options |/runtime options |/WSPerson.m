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

- (instancetype)init
{
    self = [super init];
    if (self) {
        // objc_msgSend(self, @selector(class))
        // 从自身类方法开始查找方法，然后再往上找
        NSLog(@"[self class] = %@", [self class]);// WSPerson 打印自身类
        // objc_msgSendSuper({self, [父类class])}, @selector(class)
        // 从父类方法开始查找方法，然后再往上找
        NSLog(@"[super class] = %@", [super class]);// WSPerson 打印自身类
        
        // superclass 就是得到父类，self  和  super 取决于从自身还是从父类开始查找
        NSLog(@"[self superclass] = %@", [self superclass]); // NSObject 打印父类
        NSLog(@"[super superclass] = %@", [super superclass]); // NSObject 打印父类
    }
    return self;
}
// 伪代码实现
- (Class)class{
    return object_getClass(self);// 方法的返回值取决于方法调用者/消息接收者
}
- (Class)superclass{
    return class_getSuperclass(object_getClass(self)); // 得到 self 的父类
}
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
//        return nil;
        return [NSMethodSignature signatureWithObjCTypes:"V@:"];
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
