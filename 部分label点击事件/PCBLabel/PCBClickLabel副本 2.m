//
//  PCBClickLabel.m
//  部分label点击事件
//
//  Created by apple on 17/3/5.
//  Copyright © 2017年 Wade. All rights reserved.
//

#import "PCBClickLabel.h"
@interface PCBClickLabel()
@property (nonatomic, strong)UILabel *commonLabel;
@property (nonatomic, strong)UILabel *clickLabel;
@property (nonatomic, assign)CGRect commonLabelFrame;
@property (nonatomic, assign)CGRect clickLabelFrame;
@property (nonatomic, strong)NSString *clickText;
@property (nonatomic, strong)NSString *commonText;
//@property (nonatomic, assign)CGRect selfFrame;

@end

@implementation PCBClickLabel

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _commonLabel = [UILabel new];
        _clickLabel = [UILabel new];
//        _commonLabel.frame = _commonLabelFrame;
//        _clickLabel.frame = _clickLabelFrame;
        _clickLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labClick)];
        [_clickLabel addGestureRecognizer:tap];
        [self addSubview:_commonLabel];
        [self addSubview:_clickLabel];
    }
    return self;
}

+ (instancetype)createLabelViewWithLab:(NSString *)text clickTextRange:(NSRange)clickTextRange clickAtion:(clickBlock)clickAtion{
    //变量
    NSString *clickText;
    NSString *commonText;

    PCBClickLabel *pClickLabel = [PCBClickLabel new];
    pClickLabel.backgroundColor = [UIColor yellowColor];
//    pClickLabel.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-(clickLabel.frame.size.width+commonLabel.frame.size.width))/2, 10, [[self class] calculateRowWidth:text], 30);
    pClickLabel.clickBlock = clickAtion;
//    pClickLabel.clickLab = clickLabel;
//    [pClickLabel addSubview:commonLabel];
//    [pClickLabel addSubview:clickLabel];
    
    //如果选择的范围文字是文尾的文字，而不是中间的文字或者开头的文字
    if (clickTextRange.location + clickTextRange.length == text.length) {
        clickText = [text substringWithRange:clickTextRange];
        commonText = [text substringToIndex:clickTextRange.location];
        //label的位置
        pClickLabel.commonLabelFrame = CGRectMake(0, 0, [[self class] calculateRowWidth:commonText], 30);
        CGRect dd = CGRectMake(0, 0, [[self class] calculateRowWidth:commonText], 30);
        pClickLabel.clickLabelFrame = CGRectMake(pClickLabel.commonLabelFrame.size.width+pClickLabel.commonLabelFrame.origin.x, 0, [[self class] calculateRowWidth:clickText], 30);
        NSLog(@"fdd=%@",NSStringFromCGRect(dd));

        NSLog(@"fra=%@",NSStringFromCGRect(pClickLabel.commonLabelFrame));

        NSLog(@"fra=%@",NSStringFromCGRect(pClickLabel.clickLabelFrame));
    }else if (clickTextRange.location == 0) {//选择的范围文字是开头的
        clickText = [text substringWithRange:clickTextRange];
        commonText = [text substringWithRange:NSMakeRange(clickText.length, text.length-clickText.length)];
        //label的位置
        pClickLabel.clickLabelFrame = CGRectMake(0, 0, [[self class] calculateRowWidth:commonText], 30);
        pClickLabel.commonLabelFrame = CGRectMake(pClickLabel.clickLabelFrame.size.width+pClickLabel.clickLabelFrame.origin.x, 0, [[self class] calculateRowWidth:clickText], 30);
        //label的位置
//        clickLabel.frame = CGRectMake(0, 0, [[self class] calculateRowWidth:commonText], 30);
//        commonLabel.frame = CGRectMake(clickLabel.frame.size.width+clickLabel.frame.origin.x, 0, [[self class] calculateRowWidth:clickText], 30);
    }else { //可点击文字在整段文字中间
        //        UILabel label3 = [UILabel new];
    }
    
    
   
    
//    commonLabel.text = commonText;
//    clickLabel.text = clickText;

        pClickLabel.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-(pClickLabel.clickLabelFrame.size.width+pClickLabel.commonLabelFrame.size.width))/2, 10, [[self class] calculateRowWidth:text], 30);
        pClickLabel.commonText = commonText;
        pClickLabel.clickText = clickText;
 
    return pClickLabel;
}

+ (CGFloat)calculateRowWidth:(NSString *)string {
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};  //指定字号
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0, 30)/*计算宽度时要确定高度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width;
}

- (void)labClick {
    //    NSLog(@"点击了%@",self.clickLabStr);
    self.clickBlock();
}

- (void)setCommonText:(NSString *)commonText {
    _commonLabel.text = commonText;
}

- (void)setClickText:(NSString *)clickText {
    _clickLabel.text = clickText;
}
- (void)setCommonLabelFrame:(CGRect)commonLabelFrame {
    _commonLabel.frame = commonLabelFrame;
}
- (void)setClickLabelFrame:(CGRect)clickLabelFrame {
    _clickLabel.frame = clickLabelFrame;
}
//- (void)setSelfFrame:(CGRect)selfFrame {
//    self.frame = selfFrame;
//}
@end
