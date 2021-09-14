//
//  ViewController.m
//  block ios
//
//  Created by 16 Macbook Pro on 2021/8/22.
//

#import "ViewController.h"
#import "WSPerson.h"
typedef void (^WSBlock)(void);


@interface ViewController ()

@property (nonatomic, strong) WSPerson *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WSBlock block;
    __block int age = 10;
    NSObject *obj = [[NSObject alloc] init];
    __weak NSObject *weakObject = obj;
    block = ^{
        NSLog(@"%d, %@, %@", age, obj, weakObject);
    };
    block();
    
    [self testPersonBlock];
}

- (void)testPersonBlock{
    WSPerson *person = [[WSPerson alloc] init];
    person.testBlock();
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //1. 
    WSPerson *person = [[WSPerson alloc] init];
    person.name = @"sws";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@", person.name);
    });
    
    //2. 3秒释放
//    WSPerson *person1 = [[WSPerson alloc] init];
//    person1.name = @"sws1";
//    __weak WSPerson *weakPerson = person1;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"%@", weakPerson.name);
//    });
    
    //2.1 访问为空
    WSPerson *person1 = [[WSPerson alloc] init];
    person1.name = @"sws1";
    __weak WSPerson *weakPerson = person1;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@", weakPerson);
    });
    
    //3. 3秒释放
//    WSPerson *person2 = [[WSPerson alloc] init];
//    person2.name = @"sws2";
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"%@", person2.name);
//        });
//    });
    
    //3.1.// 3秒释放，整体有强引用
//    WSPerson *person2 = [[WSPerson alloc] init];
//    person2.name = @"sws2";
//    __weak WSPerson *weakPerson = person1;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//      NSLog(@"%@", weakPerson);
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"%@", person2);
//        });
//    });
}

@end
