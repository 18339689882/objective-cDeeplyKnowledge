//
//  WSPerson.h
//  对象的内存管理01
//
//  Created by sws on 2021/9/10.
//

#import <Foundation/Foundation.h>
#import "WSDog.h"
NS_ASSUME_NONNULL_BEGIN

@interface WSPerson : NSObject
{
    WSDog *_dog;
}

-(void)setDog:(WSDog *)dog;

-(WSDog *)dog;

@property (nonatomic, assign) int age;
@end

NS_ASSUME_NONNULL_END
