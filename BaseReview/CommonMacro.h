//
//  CommonMacro.h
//  BaseReview
//
//  Created by aoll on 2018/6/7.
//  Copyright © 2018年 RunningAlice. All rights reserved.
//

#ifndef CommonMacro_h
#define CommonMacro_h


#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define NavBarHeight                        self.navigationController.navigationBar.bounds.size.height
#define StatusBarHeight                     20
#define TabBarHeight                        self.tabBarController.tabBar.bounds.size.height

//通过使用#pragma clang diagnostic push/pop 告诉Clang编译器仅仅为某一特定部分的代码来忽略特定警告
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \
            "-Warc-performSelector-leaks\"") \
    Stuff; \
    _Pragma("clang diagnostic pop") \
} while (0)





#endif /* CommonMacro_h */
