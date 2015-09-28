//
//  EBTCountDownTimeLabel.m
//  EBTCountDownTimeLabel
//
//  Created by ebaotong on 15/9/28.
//  Copyright (c) 2015年 com.csst. All rights reserved.
//

#import "EBTCountDownTimeLabel.h"
#define kTimeTypeOjectForKey  @"TimeType"
@interface EBTCountDownTimeLabel ()
{
    NSTimer *countTimer; //定时器
    NSTimeInterval countTime; //倒计时
}
@end


@implementation EBTCountDownTimeLabel

- (void)countDownTimer:(NSTimeInterval)seconds countTimeType:(EBTCountDownTimeType)countTimeType  completeHandler:(EBTCountDownCompleteHandler)countTimeCompleteHandler
{

    timeCompleteHandler = countTimeCompleteHandler;
    [self startTimer:seconds countTimeType:countTimeType];

}


/**
 *  开始计时
 */
- (void)startTimer:(NSTimeInterval)seconds countTimeType:(EBTCountDownTimeType)countTimeType
{
    
    if (countTimer)
    {
        [self stopTimer];
    }
    countTime = seconds==0?0:seconds ;
    NSDictionary *timeTypeDict = [NSDictionary dictionaryWithObjectsAndKeys:@(countTimeType),kTimeTypeOjectForKey ,nil];
    countTimer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(countDown:) userInfo:timeTypeDict repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:countTimer forMode:NSRunLoopCommonModes];
}
/**
 *  停止计时
 */
- (void)stopTimer
{
    [countTimer  invalidate];
    countTimer = nil;
}
/**
 *  开始倒计时计算处理格式化
 */
-(void)countDown:(NSTimer *)timer
{
    NSDictionary *timerResult = [timer userInfo];
    EBTCountDownTimeType countTimeType = [[timerResult objectForKey:kTimeTypeOjectForKey] integerValue];
    countTime --;
    if(countTime >= 0)
    {
        NSInteger day = countTime/86400;
        NSInteger hour = (countTime-(day*86400))/3600;
        NSInteger minute = (countTime-(day*86400)-(hour*3600))/60;
        NSInteger second = (countTime-(day*86400)-(hour*3600)-minute*60);
        
    /*************************这里显示格式可以根据自己的需要来修改并设置对应的富文本样************************************/
        NSString *resultStr = nil;//保存最终要显示内容
        NSInteger resultCount = 0;//根据显示格式来对label进行富文本处理
        if (countTimeType==EBTCountDownTimeTypeDayToSeconds)
        {
            resultStr = [NSString stringWithFormat:@"%0.2zd天%0.2zd时%0.2zd分%0.2zd秒",day,hour,minute,second];
            resultCount = 4;
        }
        else
        {
             resultStr = [NSString stringWithFormat:@"%0.2zd时%0.2zd分%0.2zd秒",hour,minute,second];
             resultCount = 3;
        }
        NSString *timerStr = resultStr;
        NSString *resultTime = [NSString stringWithFormat:@"募集剩余时间 %@",timerStr];
        
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:resultTime];
        NSDictionary *attribute_Dic = @{
                                        NSFontAttributeName:[UIFont systemFontOfSize:8.f],
                                        NSForegroundColorAttributeName : [UIColor blackColor]
                                        };
        [ attributeString addAttributes:attribute_Dic range:NSMakeRange(7, timerStr.length)];
        /**通过设置富文本属性来设置label背景颜色**/
        for (NSInteger i = 0; i<resultCount; i++)
        {
            NSDictionary * attribute_BackGround = @{
                                                    NSBackgroundColorAttributeName:[UIColor redColor],
                                                    NSForegroundColorAttributeName:[UIColor whiteColor],
                                                    NSFontAttributeName:[UIFont systemFontOfSize:10.f],
                                                    NSStrokeColorAttributeName:[UIColor whiteColor],
                                                    };
            
            [ attributeString addAttributes:attribute_BackGround range:NSMakeRange(7+3*i, 2)];
        }
        
        if (timeCompleteHandler)
        {
            timeCompleteHandler(timerStr);
        }
        self.attributedText = attributeString;
    }
    else
    {
        [self stopTimer];
    }
}
/**
 *  停止定时器并移除label
 */
- (void)removeCountDownTimer
{
    [self stopTimer];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });

}
@end
