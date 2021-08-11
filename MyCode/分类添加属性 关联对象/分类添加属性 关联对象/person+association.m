//
//  person+association.m
//  分类添加属性 关联对象
//
//  Created by 16 Macbook Pro on 2021/8/11.
//

#import "person+association.h"
#import <objc/runtime.h>
@implementation person (association)

- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSString *)name{
    return objc_getAssociatedObject(self, _cmd);
}
@end
