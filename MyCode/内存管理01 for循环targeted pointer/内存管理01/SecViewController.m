//
//  SecViewController.m
//  内存管理01
//
//  Created by sws on 2021/9/8.
//

#import "SecViewController.h"
#import "WSProxy1.h"
#import "WSProxy.h"

@interface SecViewController ()
@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UIButton *button;
 
@property (nonatomic, strong) dispatch_source_t gcdTimer;

@end

@implementation SecViewController

static NSString *code;

- (void)dealloc
{
    NSLog(@"__debug %s, %@",__func__, self);
    [self.timer invalidate];
    [self.displayLink invalidate];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
//    [self testCADisplayLinkAndTimer];
//    [self GCDTimer];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    NSString *code = [[NSString alloc] init];
#pragma clang diagnostic pop
    
}

- (void)GCDTimer{
    dispatch_queue_t queue = dispatch_get_main_queue();
    // 子线程执行计时器
//    dispatch_queue_t queue = dispatch_queue_create("timer", DISPATCH_QUEUE_SERIAL);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    NSTimeInterval start = 2.0;
    NSTimeInterval interval = 1.0;
    
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, interval * NSEC_PER_SEC, start * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"__debug ************* %@", [NSThread currentThread]);
    });
    // 启动定时器
    dispatch_resume(timer);
    self.gcdTimer = timer;
}

- (void)testCADisplayLinkAndTimer{
#pragma mark
#pragma mark timer
#pragma mark
    __weak typeof(self) weakSelf = self; // 弱指针解决强引用问题，是在block中。方法内部还是一个强引用关系。
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:weakSelf selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    // 解决方案1：
    // 分析：self 强引用 timer， timer 强引用block， block中弱引用self
    __weak typeof(self) weakBlockSelf = self;
    if (@available(iOS 10.0, *)) {
        self.timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [weakBlockSelf timerAction];
        }];
    } else {
        // Fallback on earlier versions
    }
    
    // 解决方案2：
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[WSProxy proxyWithTarget:self] selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)timerAction{
    NSLog(@"%s", __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
    

- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    
}
@end
