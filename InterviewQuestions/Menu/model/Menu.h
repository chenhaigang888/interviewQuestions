//
//  Menu.h
//  InterviewQuestions
//
//  Created by dnaer5 on 2021/1/21.
//

#import <Foundation/Foundation.h>
#import "CHGAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface Menu : NSObject<CHGTableViewCellModelProtocol>

@property(nonatomic, copy)NSString * name;
@property(nonatomic, strong)NSString * className;
@property(nonatomic, assign)SEL sel;

+(instancetype)initWithName:(NSString*)name className:(NSString*_Nullable)className;
+(instancetype)initWithName:(NSString*)name className:(NSString*_Nullable)className sel:(SEL)sel;

@end

NS_ASSUME_NONNULL_END
