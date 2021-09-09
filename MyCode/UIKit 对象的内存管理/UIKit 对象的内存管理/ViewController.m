//
//  ViewController.m
//  UIKit 对象的内存管理
//
//  Created by sws on 2021/9/7.
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
    SecViewController *vc = [[SecViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
