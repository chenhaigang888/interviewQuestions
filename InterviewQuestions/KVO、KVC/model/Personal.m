//
//  Personal.m
//  InterviewQuestions
//
//  Created by dnaer5 on 2021/1/21.
//

#import "Personal.h"

@implementation Personal

- (void)willChangeValueForKey:(NSString *)key {
    [super willChangeValueForKey:key];
    NSLog(@"当前方法:%s",__func__);
}

- (void)didChangeValueForKey:(NSString *)key {
    [super didChangeValueForKey:key];
    NSLog(@"当前方法:%s",__func__);
}

-(void)testName:(NSString*)name {
    _name = name;
    NSLog(@"直接修改成员变量");
}

@end
