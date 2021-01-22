//
//  MessageForwardViewController.m
//  InterviewQuestions
//
//  Created by dnaer5 on 2021/1/22.
//

#import "MessageForwardViewController.h"
#import "CHGAdapter.h"
#import "Menu.h"
#import "SubMessage.h"

@interface MessageForwardViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) SubMessage * subMessage;

@end

@implementation MessageForwardViewController

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
}

- (SubMessage *)subMessage {
    if (!_subMessage) {
        _subMessage = [SubMessage new];
    }
    return _subMessage;
}

-(NSArray*)menus {
    return @[
        @[[Menu initWithName:@"消息转发" className:nil sel:@selector(messageForward)]]];
}

-(void)messageForward {
    [self.subMessage testMsg:@"aa"];
    
    
}

@end
