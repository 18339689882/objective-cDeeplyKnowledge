//
//  ViewController.m
//  内存管理01
//
//  Created by sws on 2021/9/8.
//

#import "ViewController.h"
#import "SecViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[[SecViewController alloc] init] animated:YES];
}

@end
