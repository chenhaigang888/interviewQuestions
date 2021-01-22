//
//  Animal.m
//  InterviewQuestions
//
//  Created by dnaer5 on 2021/1/22.
//

#import "Animal.h"

@implementation Animal

+(instancetype)initWithName:(NSString*)name {
    Animal * animal = [Animal new];
    animal.name = name;
    return animal;
}

- (void)setName:(NSString *)name {
    _name = name;
    NSLog(@"%s",__func__);
}

//如果找不到setKey:  _setKey会访问此方法，如果返回YES则 会调按照顺序调用 key,_key,_isKey,isKey
+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

//优先级最高
//-(void)setType:(NSString*)type {
//    NSLog(@"%s",__func__);
//}
//
//优先级仅次于setType
//-(void)_setType:(NSString*)type {
//    NSLog(@"%s",__func__);
//}

//如果accessInstanceVariablesDirectly方法返回NO会调用这个方法，如果这个方法不重新会抛出异常
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
//    NSLog(@"%s   value:%@, key:%@",__func__,value,key);
//
//}
//
@end
