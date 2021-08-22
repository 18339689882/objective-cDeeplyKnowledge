//
//  main.m
//  block
//
//  Created by 16 Macbook Pro on 2021/8/22.
//

#import <Foundation/Foundation.h>
#import "WSPerson.h"

typedef void (^WSBlock)(void);

int allAge = 1;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        WSBlock block;
        // 强引用默认
        // WSPerson *person = [[WSPerson alloc] init];
        
//        block = ^{
//            NSLog(@"%@",person.name);
//        };
//
//        block();
//        void (^block)(void) = ^{
//            NSLog(@"***** block print ****");
//        };
        /// 释放block，-> dispose（） 释放person。
        
        #pragma mark 修改外部变量
        // __block 局部变量修改
        // static 修改
        // 全部变量
        __block int age = 10;
        static int staticAge = 10;
        block = ^{
            allAge = 20;
            staticAge = 20;
            age = 10;
        };
        
    }
    return 0;
}

