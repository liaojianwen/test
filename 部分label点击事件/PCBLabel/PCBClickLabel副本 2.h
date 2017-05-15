//
//  PCBClickLabel.h
//  部分label点击事件
//
//  Created by apple on 17/3/5.
//  Copyright © 2017年 Wade. All rights reserved.
//

#import <UIKit/UIKit.h>
//点击按钮
typedef void (^clickBlock)();
@interface PCBClickLabel : UIView
+ (instancetype)createLabelViewWithLab:(NSString *)text clickTextRange:(NSRange)clickTextRange clickAtion:(clickBlock)clickAtion;
@property (nonatomic, copy)clickBlock clickBlock;
@end
