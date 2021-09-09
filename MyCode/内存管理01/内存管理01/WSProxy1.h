//
//  WSProxy1.h
//  内存管理01
//
//  Created by sws on 2021/9/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WSProxy1 : NSObject

+ (instancetype)proxyWithTarget:(id)target;

@property (nonatomic, weak) id target;

@end

NS_ASSUME_NONNULL_END
