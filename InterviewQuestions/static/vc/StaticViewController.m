//
//  StaticViewController.m
//  InterviewQuestions
//
//  Created by dnaer5 on 2021/1/22.
//

#import "StaticViewController.h"
#import "Measurement.h"

@interface StaticViewController ()

@end


@implementation StaticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)btnTap:(id)sender {
    static Measurement * measurement;
    if (!measurement) {
        measurement = [[Measurement alloc] init];
    }
    measurement.i = measurement.i + 1;
    NSLog(@"i:%li",measurement.i);
}

- (IBAction)secondBtn:(id)sender {
    Measurement * measurement = [Measurement new];
    [self test:measurement];
    NSLog(@"measurement.i:%li",measurement.i);
}

-(void)test:(Measurement*)measurement {
    measurement.i = 2;
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

@end
