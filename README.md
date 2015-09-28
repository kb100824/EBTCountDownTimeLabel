# 实现倒计时目前有两种格式:天时分秒或者 时分秒
# 使用方法:
1 先把EBTCountDownTimeLabel的.h和.m文件导入工程中。
2 在xib或者sb上把label的class设置为:EBTCountDownTimeLabel
#具体操作如下
@property (weak, nonatomic) IBOutlet EBTCountDownTimeLabel *lblDayToSecond;
@property (weak, nonatomic) IBOutlet EBTCountDownTimeLabel *lblHourToSecond;
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

#演示效果图











