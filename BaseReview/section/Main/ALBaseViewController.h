//
//  ALBaseViewController.h
//  BaseReview
//
//  Created by aoll on 2018/7/5.
//  Copyright © 2018年 RunningAlice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALBaseViewController : UIViewController


/**
 默认配置
 */
- (void)defaultConfig;

/**
 初始化view，在子类中重写
 */
- (void)setUpView;


/**
 初始化数据，在子类中重写
 */
- (void)setUpData;


/**
 在MVVM中用于绑定数据，在子类重写
 */
- (void)bindingData;


@end
