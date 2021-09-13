//
//  ViewController.m
//  weak 原理01
//
//  Created by 16 Macbook Pro on 2021/9/12.
//

#import "ViewController.h"
#import "WSPerson.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak WSPerson *weakPerson;
    __strong WSPerson *strongPerson;
    __unsafe_unretained WSPerson *unsafePersonl;
    
    NSLog(@"111111");
    
    {
        // 1
        // WSPerson *person = [[WSPerson alloc] init];
        
        // 2
         WSPerson *person = [[WSPerson alloc] init];
        weakPerson = person;
        
        // 3
//         WSPerson *person = [[WSPerson alloc] init];
//        strongPerson = person;
//
        // 4
//         WSPerson *person = [[WSPerson alloc] init];
//        unsafePersonl = person;// EXC_BAD_ACCESS 野指针
    }
    
    NSLog(@"111111, %@", unsafePersonl);
}


@end
