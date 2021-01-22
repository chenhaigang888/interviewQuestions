//
//  Animal.h
//  InterviewQuestions
//
//  Created by dnaer5 on 2021/1/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSObject {
    @public
    NSString * type;

    NSString * _type;
    
    NSString * _isType;
    
    NSString * isType;
}

@property(nonatomic, strong) NSString * name;


+(instancetype)initWithName:(NSString*)name;

@end

NS_ASSUME_NONNULL_END
