//
//  WSPerson.h
//  block
//
//  Created by 16 Macbook Pro on 2021/8/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WSPerson : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, copy) void(^testBlock)();

@end

NS_ASSUME_NONNULL_END
