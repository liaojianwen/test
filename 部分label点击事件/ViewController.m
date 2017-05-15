//
//  ViewController.m
//  部分label点击事件
//
//  Created by apple on 17/3/4.
//  Copyright © 2017年 Wade. All rights reserved.
//

#import "ViewController.h"
#import "PCBClickLabel.h"
#import "FMLinkLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
//    PCBClickLabel *label = [[[[PCBClickLabel alloc] initLabelViewWithLab:@"我是水电费点击文字" clickTextRange:NSMakeRange(5,2) clickTextColor:[UIColor purpleColor] clickAtion:^{
//        
//        NSLog(@"点击了1");
//        
//        
//    }] clickTextRange:NSMakeRange(1, 3) clickTextColor:[UIColor yellowColor] clickAtion:^{
//        
//        NSLog(@"点击了2");
//        
//        
//        
//    }] clickTextRange:NSMakeRange(7, 2) clickTextColor:[UIColor blueColor] clickAtion:^{
//        
//        NSLog(@"点击了3");
//        
//        
//        
//    }];
    
   // [PCBClickLabel alloc] initLabelViewWithLab:@"我是水电费点击文字" clickTextRange:<#(NSRange)#> clickTextColor:<#(UIColor *)#> clickAtion:<#^(void)clickAtion#>
    
    PCBClickLabel *label = [[PCBClickLabel alloc] initLabelViewWithLab:@"我是水电费点击文字" clickTextRange:NSMakeRange(5, 2) clickTextColor:[UIColor purpleColor] clickAtion:^{
        
        NSLog(@"点击了");
        
    }];
    [self.view addSubview:label];
    //[self.view addSubview:label];
    
    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    [self.view addSubview:la];
    la.text = @"111111111111";
    la.userInteractionEnabled = YES;
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [la addGestureRecognizer:ges];
    //[UIColor purpleColor]
    
    
    FMLinkLabel *fm = [[FMLinkLabel alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 100)];
    [self.view addSubview:fm];
    NSString *str = @"呵呵哒 :呵呵呵呵呵呵呵呵额哈哈哈呵 这里可以点击 呵呵呵额哈哈哈呵呵呵呵呵呵呵呵额哈哈哈呵呵呵呵呵呵呵呵额哈哈哈呵呵呵";
    
    fm.text = str;
    
    fm.font = [UIFont systemFontOfSize:20];
    fm.numberOfLines = 0;
    
    [fm addClickText:@"呵呵哒 :" attributeds:@{NSForegroundColorAttributeName : [UIColor orangeColor]} transmitBody:(id)@"呵呵哒 被点击了" clickItemBlock:^(id transmitBody) {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"%@", transmitBody] delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil] show];
    }];
    
    [fm addClickText:@"这里可以点击" attributeds:@{NSForegroundColorAttributeName : [UIColor greenColor]} transmitBody:(id)@"确实可以点击" clickItemBlock:^(id transmitBody) {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"%@", transmitBody] delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil] show];
    }];
}

- (void)click{
    NSLog(@"click");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
