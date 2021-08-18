//
//  main.m
//  分类添加属性 关联对象
//
//  Created by 16 Macbook Pro on 2021/8/11.
//

#import <Foundation/Foundation.h>
#import "person+association.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        person *per = [[person alloc] init];
        per.name = @"xiaohong";
        
        person *per2 = [[person alloc] init];
        per2.name = @"xiaohong222";
        
        NSLog(@"%@   %@", per.name, per2.name);
    }
    return 0;
}
