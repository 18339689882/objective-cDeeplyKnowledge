//
//  WSPerson.m
//  对象的内存管理01
//
//  Created by sws on 2021/9/10.
//

#import "WSPerson.h"

@implementation WSPerson

@synthesize age = _age;

- (void)dealloc
{
    [_dog release];
    _dog = nil;
    // ******
//    self.dog = nil;
    NSLog(@"%s", __func__);
    [super dealloc];
}

-(void)setDog:(WSDog *)dog{
    if (_dog != dog) {
        [_dog release];
        _dog = [dog retain];
    }
}

-(WSDog *)dog{
    return _dog;
}

@end
