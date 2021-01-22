//
//  Menu.m
//  InterviewQuestions
//
//  Created by dnaer5 on 2021/1/21.
//

#import "Menu.h"

@implementation Menu

+(instancetype)initWithName:(NSString*)name className:(NSString*_Nullable)className{
    Menu * menu = [Menu new];
    menu.name = name;
    menu.className = className;
    return menu;
}

+(instancetype)initWithName:(NSString*)name className:(NSString*_Nullable)className sel:(SEL)sel {
    Menu * menu = [Menu initWithName:name className:className];
    menu.sel = sel;
    return menu;
}

- (NSString *)cellClassNameInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return @"MenuTableViewCell";
}

- (CGFloat)cellHeighInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return 44;
}

@end
