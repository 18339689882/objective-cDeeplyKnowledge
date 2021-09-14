//
//  SecViewController.m
//  UIKit 对象的内存管理
//
//  Created by sws on 2021/9/7.
//

#import "SecViewController.h"
#import "TestModel.h"
@interface SecViewController ()

@property (nonatomic, copy) void(^testBlock)(void);

@property (nonatomic, strong) TestModel *model;

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    __weak typeof(self) weakSelf = self;
    self.testBlock = ^{
        NSLog(@"__debug %@", weakSelf.model);
    };
    
    self.testBlock();
}

- (void)dealloc
{
    NSLog(@"__debug %s", __func__);
}

@end
