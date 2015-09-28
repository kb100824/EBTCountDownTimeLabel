//
//  ViewController.m
//  EBTCountDownTimeLabel
//
//  Created by ebaotong on 15/9/28.
//  Copyright (c) 2015年 com.csst. All rights reserved.
//
#import "EBTCountDownTimeLabel.h"
#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet EBTCountDownTimeLabel *lblDayToSecond;
@property (weak, nonatomic) IBOutlet EBTCountDownTimeLabel *lblHourToSecond;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  天时分秒
 *
 *  @param sender
 */
- (IBAction)btnClick:(UIButton *)sender {
    
   [_lblDayToSecond countDownTimer:20 countTimeType:EBTCountDownTimeTypeDayToSeconds completeHandler:^(NSString *countTime) {
       
       NSLog(@"countTime = %@",countTime);
       if ([countTime isEqualToString:@"根据你设置的条件来移除倒计时"]) {
           [_lblDayToSecond removeCountDownTimer];
       }
       
   }];
}
/**
 *  时分秒
 *
 *  @param sender
 */
- (IBAction)btnAction:(UIButton *)sender {
    [_lblHourToSecond countDownTimer:20 countTimeType:EBTCountDownTimeTypeHourToSeconds completeHandler:^(NSString *countTime) {
        
        NSLog(@"countTime = %@",countTime);
        if ([countTime isEqualToString:@"根据你设置的条件来移除倒计时"]) {
            [_lblHourToSecond removeCountDownTimer];
        }
        
    }];

}

@end
