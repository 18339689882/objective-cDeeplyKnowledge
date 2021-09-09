//
//  ViewController.m
//  Runloop
//
//  Created by sws on 2021/9/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"mainRunloop = %@", [NSRunLoop mainRunLoop]);
}


@end
