//
//  ProxyTimerTarget.m
//
//  Created by Ori on 2019/5/12.
//  Copyright © 2019 Ori. All rights reserved.
//

#import "ProxyTimerTarget.h"

@interface ProxyTimerTarget ()
// 目标对象
@property (nonatomic, weak) id target;
// 目标方法
@property (nonatomic, assign) SEL selector;
@end

@implementation ProxyTimerTarget

- (void)tickTock:(NSTimer *)timer {
    // target为弱引用,所以当target对象销毁时,target 为nil
    if (self.target) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.selector withObject:timer.userInfo];
#pragma clang diagnostic pop
    } else {
        [timer invalidate];
    }
}

+ (NSTimer *)scheduledTimerWithTimerInterval:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)repeats {
    
    ProxyTimerTarget *timerTarget = [[ProxyTimerTarget alloc]init];
    timerTarget.target = aTarget;
    timerTarget.selector = aSelector;
    return [NSTimer scheduledTimerWithTimeInterval:interval target:timerTarget selector:@selector(tickTock:) userInfo:userInfo repeats:repeats];
}

@end
