//
//  SubMessage.m
//  InterviewQuestions
//
//  Created by dnaer5 on 2021/1/22.
//

#import "SubMessage.h"
#import <objc/runtime.h>
#import "HandlerNoMethod.h"



/// 消息转发有2中方案

/// 方案一：交给当前对象的其他方法来处理。

/// 方案二：将消息转发给其他对象来处理

/// 方案三：
@implementation SubMessage

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%s   sel:%@",__func__,NSStringFromSelector(sel));
    if (sel == @selector(testMsg:)) {
        //解析实例方法
//        NSLog(@"解析实例方法,交给其他方法处理");
        IMP imp           = class_getMethodImplementation(self, @selector(handle_testMsg:));
        Method handle_testMsg = class_getInstanceMethod(self, @selector(handle_testMsg:));
        const char *type  = method_getTypeEncoding(handle_testMsg);

//        int methodCount;
//
//        Method *methodList = class_copyMethodList(self, &methodCount);
//
//        unsigned int i = 0;
//        for (; i < methodCount; i++) {
//            NSString * className = [NSString stringWithCString:class_getName(self) encoding:NSUTF8StringEncoding];
//            NSString * methodName = [NSString stringWithCString:sel_getName(method_getName(methodList[i])) encoding:NSUTF8StringEncoding];
////            NSLog(@"className:%@    methodName: %@", className, methodName);
//        }
        return class_addMethod(self, sel, imp, type);
    }
    return [super resolveInstanceMethod:sel];
}

//快速转发给指定的对象处理
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%s",__func__);
    return [HandlerNoMethod alloc];//交给HandlerNoMethod类的这一方法处理
}

//慢速转发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"%s",__func__);
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%s",__func__);
    id ss = [HandlerNoMethod alloc];
    anInvocation.target = ss;
    [anInvocation invoke];
//    [super forwardInvocation:anInvocation];
}

-(void)handle_testMsg:(NSString*)msg {
    NSLog(@"%s   参数：%@",__func__,msg);
}

@end
