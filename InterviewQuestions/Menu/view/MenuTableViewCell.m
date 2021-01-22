//
//  MenuTableViewCell.m
//  InterviewQuestions
//
//  Created by dnaer5 on 2021/1/21.
//

#import "MenuTableViewCell.h"
#import "Menu.h"

@implementation MenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cellWillAppear {
    [super cellWillAppear];
    Menu * menu = self.model;
    self.textLabel.text = menu.name;
}

@end
