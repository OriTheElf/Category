//
//  ProxyTimerTarget.h
//
//  Created by Ori on 2019/5/12.
//  Copyright © 2019 Ori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProxyTimerTarget : NSObject

/**
 创建弱引用的Timer

 */
+ (NSTimer *)scheduledTimerWithTimerInterval:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)repeats;
@end
