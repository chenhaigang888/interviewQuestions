//
//  Animal2.m
//  InterviewQuestions
//
//  Created by dnaer5 on 2021/1/22.
//

#import "Animal2.h"

@implementation Animal2

- (instancetype)init
{
    self = [super init];
    if (self) {
//        _type = @"_type";
//        _isType = @"_isType";
//        type = @"type";
//        isType = @"isType";
    }
    return self;
}

//-(NSString*)getType {
//    return @"m getType";
//}

//-(NSString*)type {
//    return @"m type";
//}

//-(NSString*)isType {
//    return @"m isType";
//}

//-(NSString*)_type {
//    return @"m _type";
//}

+ (BOOL)accessInstanceVariablesDirectly {
    NSLog(@"%s",__func__);
    return YES;
}




@end
