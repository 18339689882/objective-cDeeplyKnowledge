//
//  main.m
//  OC三大对象
//
//  Created by sws on 2021/7/30.
//


#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "NSObject+mainTest.h"
#import "MJClassInfo.h"
@interface Person: NSObject<NSCoding>
- (void)test;
+ (void)test;
@end

@implementation Person

- (void)test{
    NSLog(@"- [Person categary]  %@", self);
}

+ (void)test{
    NSLog(@"+ [Person categary]  %@", self);
}

@end

@interface Student : Person<NSCopying>
{
    CGFloat _width;
}
@property (nonatomic, strong) NSString *name;

- (void)test;
@end

@implementation Student
- (void)test{
    NSLog(@"- [Person categary]  %@", self);
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *student = [[Student alloc] init];
        Person *person = [[Person alloc] init];
        NSLog(@"%p %p %p", student, person , object_getClassName([student class]));
        
        mj_objc_class *mjClass = (__bridge mj_objc_class *)([Student class]);
        class_rw_t *studentClassData = mjClass->data();
        NSLog(@"--------");
    }
    return 0;
}
