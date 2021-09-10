//
//  main.m
//  对象的内存管理01
//
//  Created by sws on 2021/9/10.
//

#import <Foundation/Foundation.h>
#import "WSPerson.h"

void testPersonDog1()
{
    // 内存泄露，改释放的对象没有释放。
    WSPerson *person = [[WSPerson alloc] init];
    WSDog *dog = [[WSDog alloc] init];
    WSPerson *person1 = [[WSPerson alloc] init];

    [person setDog:dog];
    [[person dog] wangwang];
    [dog release];
    [[person dog] wangwang];
    [person release];
    [[person1 dog] wangwang];
    [person1 release];
}

void testPersonDog2(){
    WSDog *dog1 = [[WSDog alloc] init]; // dog1: 1
    WSDog *dog2 = [[WSDog alloc] init]; // dog2: 1
    WSPerson *person = [[WSPerson alloc] init];
    
    [person setDog:dog1];// dog1: 2
    [person setDog:dog2];// dog2: 2, dog1 : 1
    
    [dog1 release]; // dog1: 1 -> dog1: 0
    [dog2 release]; // dog2: 1
    [person release]; // dog2: 0
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        WSDog *dog = [[WSDog alloc] init]; // dog: 1
        WSPerson *person = [[WSPerson alloc] init];
        
        [person setDog:dog];
        [dog release];
        [person setDog:dog];
        
        [person release];
    }
    return 0;
}
