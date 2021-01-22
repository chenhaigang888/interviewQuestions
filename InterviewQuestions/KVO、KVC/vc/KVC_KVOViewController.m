//
//  KVC_KVOViewController.m
//  InterviewQuestions
//
//  Created by dnaer5 on 2021/1/21.
//

#import "KVC_KVOViewController.h"
#import "Personal.h"
#import "Menu.h"
#import "Animal.h"
#import "Animal2.h"

@interface KVC_KVOViewController ()

/// 验证kvo特性
@property(nonatomic, strong) Personal * personal;
/// 验证kvc赋值特性
@property(nonatomic, strong) Animal * animal;
/// 验证kvc取值特性
@property(nonatomic, strong) Animal2 * animal2;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation KVC_KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableViewAdapter.footerHeight = 0;
    self.tableView.cellDatas = [self menus];
    
    __weak typeof(self) weakSelf = self;
    self.tableView.tableViewDidSelectRowBlock = ^(UITableView *tableView, NSIndexPath *indexPath, id itemData) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        Menu *menu = itemData;
        [strongSelf performSelector:menu.sel];
    };
    
    self.animal = [Animal initWithName:@"动物"];
    self.animal2 = [Animal2 new];
    
    self.personal = [Personal new];
    self.personal.name = @"name1";
    self.personal.age = 1;
    [self.personal addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
}

-(NSArray*)menus {
    return @[
        @[[Menu initWithName:@"通过调用被观察对象的set方法触发kvo" className:nil sel:@selector(triggerWithSetKeyMethod)],
          [Menu initWithName:@"通过KVC触发kvo" className:nil sel:@selector(triggerWithKVC)],
          [Menu initWithName:@"手动调用willChangeValueForKey触发kvo" className:nil sel:@selector(triggerWith_will_did_ChangeValueForKey)],
          [Menu initWithName:@"测试直接给成员变量赋值" className:nil sel:@selector(test_instanceVar)]],
        @[[Menu initWithName:@"KVC赋值顺序测试" className:nil sel:@selector(kvc_assignment_order)],
          [Menu initWithName:@"KVC取值顺序测试" className:nil sel:@selector(kvc_get_order)]]];
}

#pragma -mark kvo测试
-(void)triggerWithSetKeyMethod{
    self.personal.name = @"1";
}

-(void)triggerWithKVC {
    [self.personal setValue:@"bb" forKey:@"name"];
}

-(void)triggerWith_will_did_ChangeValueForKey {
    [self.personal willChangeValueForKey:@"name"];
    [self.personal didChangeValueForKey:@"name"];
}

-(void)test_instanceVar {
    [self.personal testName:@"直接修改成员变量"];
}

#pragma -mark kvc测试
-(void)kvc_assignment_order {
//    [self.animal setValue:@"🐒" forKey:@"name"];
    
    [self.animal setValue:@"aaa" forKey:@"type"];
    
    NSLog(@"_type:%@",self.animal->_type);
    NSLog(@"type:%@",self.animal->type);
    NSLog(@"_isType:%@",self.animal->_isType);
    NSLog(@"isType:%@",self.animal->isType);
}

-(void)kvc_get_order {
    NSString * type = [self.animal2 valueForKey:@"type"];
    NSLog(@"type:%@",type);
}

#pragma -mark observe
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"触发kvo");
    }
}

@end
