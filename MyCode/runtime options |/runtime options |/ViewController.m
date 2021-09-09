//
//  ViewController.m
//  runtime options |
//
//  Created by 16 Macbook Pro on 2021/8/27.
//

#import "ViewController.h"
#import "WSPerson.h"
//typedef enum {
//    WSOptionsOne = 1,   // ob0001
//    WSOptionsTwo = 2,   // ob0010
//    WSOptionsThree = 4, // ob0100
//    WSOptionsFour = 8,  // ob1000
//} WSOptions;

typedef enum {
    WSOptionsOne = 1<<0,   // ob0001
    WSOptionsTwo = 1<<1,   // ob0010
    WSOptionsThree = 1<<2, // ob0100
    WSOptionsFour = 1<<3,  // ob1000
} WSOptions;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setOptions:WSOptionsOne + WSOptionsTwo + WSOptionsThree]; // ob0111
//    [self setOptions:WSOptionsOne | WSOptionsTwo | WSOptionsThree]; // ob0111
    
//    [self runtimeObjc_msg_send_test];
    [self is_Class];
}

/**
 ob0111
& ob0001
————————
ob  0001
 */

-(void)setOptions:(WSOptions)options{
    if (options & WSOptionsOne) {
        NSLog(@"包含了 WSOptionsOne");
    } else if (options & WSOptionsTwo){
        NSLog(@"包含了 WSOptionsTwo");
    } else if (options & WSOptionsThree){
        NSLog(@"包含了 WSOptionsThree");
    } else if (options & WSOptionsFour){
        NSLog(@"包含了 WSOptionsFour");
    }
}

-(void)runtimeObjc_msg_send_test{
    WSPerson *ws = [[WSPerson alloc] init];
//    [ws test];
}

-(void)is_Class{
    WSPerson *person = [[WSPerson alloc] init];
    if ([person isKindOfClass:[WSPerson class]]) {
        NSLog(@"- isKindOfClass");
    }
    if ([person isKindOfClass:[NSObject class]]) {
        NSLog(@"- NSObject isKindOfClass");
    }
    
    if ([person isMemberOfClass:[WSPerson class]]) {
        NSLog(@"- isMemberOfClass");
    }
    if ([person isMemberOfClass:[NSObject class]]) {
        NSLog(@"- NSObject isMemberOfClass");
    }
    
    if ([WSPerson isMemberOfClass:[WSPerson class]]) {
        NSLog(@"+ isMemberOfClass");
    }
    
    if ([WSPerson isKindOfClass:[WSPerson class]]) {
        NSLog(@"+ isKindOfClass");
    }
}

@end
