//
//  Person.m
//  消息转发
//
//  Created by Jason on 2018/6/7.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "Person.h"
#import "Car.h"
#import <objc/runtime.h>

@implementation Person

void run (id self, SEL _cmd,NSString *sub){
    NSLog(@"runtime添加函数");
}

//*消息转发第一步,动态添加函数
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(run)) {
        class_addMethod(self, sel, (IMP)run, "v@:@");
        return YES;
    }else {
        [super resolveInstanceMethod:sel];
    }
    return YES;
}
 
/*消息转发第二步：forwarding
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return [Car new];
}
*/

/*消息转发第三种,方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *sel = NSStringFromSelector(aSelector);
    if ([sel isEqualToString:@"run"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}
//
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL selector = [anInvocation selector];
    Car *car = [Car new];
    if ([car respondsToSelector:selector]) {
        [anInvocation invokeWithTarget:car];
    }
}
*/

@end
