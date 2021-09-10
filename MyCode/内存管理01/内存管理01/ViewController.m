//
//  ViewController.m
//  内存管理01
//
//  Created by sws on 2021/9/8.
//

#import "ViewController.h"
#import "SecViewController.h"
@interface ViewController ()

@property (nonatomic, strong) NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self testForSetName];
}


- (void)testForSetName{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    /*
        崩溃，EXC_BAD_ACCESS (code=257, address=0x66656463626111)
        原因，多次release name
        解决方案： 1、加锁，解锁 2、减小 string 长度 3、name 属性加锁。
     */
//    for (int i = 0; i < 1000; ++i) {
//        dispatch_async(queue, ^{
//            // 加锁
//            self.name = [NSString stringWithFormat:@"abcdefghijklmnopq"];
//            // 解锁
//        });
//    }
    /**
        不崩溃，原因，多次release name
        解决方案： 1、加锁，解锁 2、减小 string 长度
     */
    for (int i = 0; i < 1000; ++i) {
        dispatch_async(queue, ^{
            self.name = [NSString stringWithFormat:@"abc"];
        });
    }
    
    NSString *str1 = [NSString stringWithFormat:@"abc"];
    NSString *str2 = [NSString stringWithFormat:@"abcdefghijklmnopq"];
    NSLog(@"str1 = %p, str2 = %p", str1, str2);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[[SecViewController alloc] init] animated:YES];
}

@end
