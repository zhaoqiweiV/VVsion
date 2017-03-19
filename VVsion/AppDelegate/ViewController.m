//
//  ViewController.m
//  VVsion
//
//  Created by 赵祺伟 on 17/2/27.
//  Copyright © 2017年 KM赵. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ViewController *vc = [[ViewController alloc]init];
    
    //创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"signal"];
        [subscriber sendCompleted];
        return nil;
    }];
    //订阅信号
    [signal subscribeNext:^(id x) {
        NSLog(@"X==%@",x);
    } error:^(NSError *error) {
        NSLog(@"error=%@",error);
    } completed:^{
        NSLog(@"completed");
    }];
  
    UITextField *textfield = [[UITextField alloc]init];
    [[textfield.rac_textSignal map:^id(id value) {
        return @1;
    }]subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
        
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
