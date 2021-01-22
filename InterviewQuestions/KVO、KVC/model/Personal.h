//
//  Personal.h
//  InterviewQuestions
//
//  Created by dnaer5 on 2021/1/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Personal : NSObject

@property(nonatomic, copy)NSString * name;
@property(nonatomic, assign)NSInteger age;

-(void)testName:(NSString*)name;

@end

NS_ASSUME_NONNULL_END
