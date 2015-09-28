//
//  EBTCountDownTimeLabel.h
//  EBTCountDownTimeLabel
//
//  Created by ebaotong on 15/9/28.
//  Copyright (c) 2015年 com.csst. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void(^EBTCountDownCompleteHandler)(NSString *countTime);
typedef NS_ENUM(NSInteger, EBTCountDownTimeType)
{
    EBTCountDownTimeTypeDayToSeconds = 1,    //显示天时分秒
    EBTCountDownTimeTypeHourToSeconds       //显示时分秒

};

/**
 *  倒计时
 */
@interface EBTCountDownTimeLabel : UILabel
{

    EBTCountDownCompleteHandler timeCompleteHandler;
}
/**
 *  实现倒计时:显示天时分秒或者显示时分秒
 *
 *  @param seconds                  秒
 *  @param countTimeType            显示类型
 *  @param countTimeCompleteHandler 传递一个倒计时参数
 */
- (void)countDownTimer:(NSTimeInterval)seconds countTimeType:(EBTCountDownTimeType)countTimeType  completeHandler:(EBTCountDownCompleteHandler)countTimeCompleteHandler;
/**
 *  移除倒计时
 */
- (void)removeCountDownTimer;
@end
