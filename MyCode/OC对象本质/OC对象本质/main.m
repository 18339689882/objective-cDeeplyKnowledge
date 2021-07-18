//
//  main.m
//  OC对象本质
//
//  Created by 16 Macbook Pro on 2021/7/16.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>
// NSObject implementation
struct NSObject_IMPL {
    Class isa;
};

/**
// Class jump to define -> typedef struct objc_class *Class;
 class 是指向结构体的指针
 */
//
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc] init];
        
        // 获得obj 指针所指向内容的内存的大小。
        /**
         1. _objc_rootAllocWithZone
         2. class_createInstanceFromZone
         3 id
         _class_createInstanceFromZone(Class cls, size_t extraBytes, void *zone)
         {
             void *bytes;
             size_t size;

             // Can't create something for nothing
             if (!cls) return nil;

             // Allocate and initialize
             size = cls->alignedInstanceSize() + extraBytes;  // alignedInstanceSize = 8,  extraBytes = 0

             // CF requires all objects be at least 16 bytes.
             if (size < 16) size = 16;

             if (zone) {
                 bytes = malloc_zone_calloc((malloc_zone_t *)zone, 1, size);
             } else {
                 bytes = calloc(1, size);
             }

             return objc_constructInstance(cls, bytes);
         }
         */
        NSLog(@"%zd", malloc_size((__bridge  const void *)obj)); // 16
        // 获得NSObject 的实例对象的成员变量所占用的大小。
        /**
         size_t class_getInstanceSize(Class cls)
         {
             if (!cls) return 0;
             return cls->alignedInstanceSize();
         // alignedInstanceSize   Class's ivar size rounded up to a pointer-size boundary.
         }
         */
        NSLog(@"%zd",class_getInstanceSize([NSObject class])); // 8
        // 判断数据类型的大小，指针在64位机型上占用8个字节
        NSLog(@"%zd", sizeof(obj)); // 8
        // 类的底层实现就是结构体。
        /**
         // jump to define
         @interface NSObject  {
             Class isa ;
         }
         */
        
        /**
         c++ 文件中的结构体   对象中存储着isa指针。
         struct NSObject_IMPL {
             Class isa; // isa 地址就是结构体的地址, 第一个结构体成员的地址。
         };
         */
    }
    return 0;
}
