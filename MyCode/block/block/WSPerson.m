//
//  WSPerson.m
//  block
//
//  Created by 16 Macbook Pro on 2021/8/22.
//

#import "WSPerson.h"

@implementation WSPerson

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        __weak typeof(self) weakSelf = self;
        self.testBlock = ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                [NSThread sleepForTimeInterval:1.0];
                NSLog(@"%@", strongSelf);
            });
        };
    }
    return self;
}

@end
