//
//  MainViewController.m
//  InterviewQuestions
//
//  Created by dnaer5 on 2021/1/21.
//

#import "MainViewController.h"
#import "CHGAdapter.h"
#import "Menu.h"
#import "MessageForwardViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableViewAdapter.headerHeight = 0;
    self.tableView.tableViewAdapter.footerHeight = 0;
    self.tableView.cellDatas = @[[self menus]];
    
    __weak typeof(self) weakSelf = self;
    self.tableView.tableViewDidSelectRowBlock = ^(UITableView *tableView, NSIndexPath *indexPath, id itemData) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        Menu * menu = itemData;
        UIViewController * vc = [NSClassFromString(menu.className) new];
        vc.title = menu.name;
        [strongSelf.navigationController pushViewController:vc animated:YES];
    };
}

-(NSArray<Menu*>*) menus {
    return @[[Menu initWithName:@"KVO、KVC" className:@"KVC_KVOViewController"],
             [Menu initWithName:@"消息转发" className:@"MessageForwardViewController"]];
}

@end
