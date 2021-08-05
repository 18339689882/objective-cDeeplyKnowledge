//
//  ViewController.m
//  KVO
//
//  Created by sws on 2021/8/4.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
@interface ViewController ()

@property (nonatomic, strong) Person *person1;
@property (nonatomic, strong) Person *person2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person1 = [[Person alloc] init];
    self.person1.age = 1;
    
    self.person2 = [[Person alloc] init];
    self.person2.age = 2;
    
    NSLog(@"监听之前 person1 %p, person2 %p, select1 %p, select2 %p", object_getClass(self.person1), object_getClass(self.person2), [self.person1 methodForSelector:@selector(setAge:)], [self.person2 methodForSelector:@selector(setAge:)]);
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionNew;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:@"123"];
    
    NSLog(@"监听之后 person1 %p, person2 %p, select1 %p, select2 %p", object_getClass(self.person1), object_getClass(self.person2), [self.person1 methodForSelector:@selector(setAge:)], [self.person2 methodForSelector:@selector(setAge:)]);
    // 打印监听后的person1 p (IMP)0x10a22ac81
    // (IMP) $1 = 0x000000010a22ac81 (Foundation`_NSSetLongLongValueAndNotify)
    
    // 监听之后 类对象的isa
    NSLog(@"person1 元类对象 %p", object_getClass(object_getClass(self.person1)));
    NSLog(@"person2 元类对象 %p", object_getClass(object_getClass(self.person2)));

    self.person1->_width = 10; // ！！ 不发生kvo监听
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    self.person1.age = 10;
//    self.person2.age = 20;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@ , %@, %@", keyPath, object, change);
}

@end
