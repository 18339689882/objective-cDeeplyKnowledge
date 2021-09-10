//
//  WSDog.m
//  对象的内存管理01
//
//  Created by sws on 2021/9/10.
//

#import "WSDog.h"

@implementation WSDog
- (void)dealloc
{
    [super dealloc];
    NSLog(@"%s", __func__);
}

-(void)wangwang{
    NSLog(@"wangWang");
}
@end
