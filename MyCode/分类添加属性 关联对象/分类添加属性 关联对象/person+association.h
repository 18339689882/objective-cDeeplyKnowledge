//
//  person+association.h
//  分类添加属性 关联对象
//
//  Created by 16 Macbook Pro on 2021/8/11.
//

#import "person.h"

NS_ASSUME_NONNULL_BEGIN

@interface person (association)
@property (nonatomic, strong) NSString *name;
@end

NS_ASSUME_NONNULL_END
