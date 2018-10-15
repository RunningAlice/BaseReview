//
//  ALHomeViewController.m
//  BaseReview
//
//  Created by aoll on 2018/6/7.
//  Copyright © 2018年 RunningAlice. All rights reserved.
//

#import "ALHomeViewController.h"
#import "CommonMacro.h"

@interface ALHomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArr;



@end

@implementation ALHomeViewController

#pragma mark - Class methods


#pragma mark - Overriding methods


- (void)setUpView
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"基础回顾";
    self.navigationItem.titleView = titleLabel;
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [rightBtn setImage:[UIImage imageNamed:@"declare_icon"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = barItem;
    
    //    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor redColor]}];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    /*
     //数组与字典的快速初始化
     
     NSArray *array;
     array = @[];//空数组
     array = @[@"one"];//一个对象的数组
     array = @[@"one",@"two",@"three",@"four",@"five"];//多个对象的数组 对象不能nil,否则抛出异常
     
     NSDictionary *dict;
     dict = @{};
     dict = @{@"key1":@"value1"};
     dict = @{@"key1":@"value1",@"key2":@"value2",@"key3":@"value3",@"key4":@"value4"};
     */
    
    
    self.dataArr = @[@{@"基础控件":@[@"collectionView",@"ActionSheet",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]},
                     @{@"自定义控件":@[@"1",@"2",@"3",@"4",@"5",@"6"]},
                     @{@"设计模式":@[@"代理",@"观察者",@"通知kvo",@"MVC",@"MVP",@"MVVM",@"单例",@"策略",@"工厂"]},
                     @{@"多线程":@[@"1",@"2",@"3"]},
                     @{@"block":@[@"1",@"2",@"3",@"4"]},
                     @{@"runtime理解":@[@"1",@"2",@"3"]},
                     @{@"动画":@[@"1",@"2",@"3",@"4",@"5",@"6"]},
                     @{@"多媒体":@[@"音频",@"视频",@"图像处理"]},
                     @{@"第三方功能":@[@"支付",@"登录",@"分享"]},
                     @{@"第三方库使用":@[@"YYKit",@"ReactiveCocoa",@"cc",@"aa",@"bb",@"cc"]},
                     @{@"特效":@[@"下拉刷新",@"模糊效果",@"水滴"]}, /*https://blog.csdn.net/queenlysun/article/details/52836950*/
                     ];
}

- (void)setUpData
{
    
}

#pragma mark - Protocol methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dic = [self.dataArr objectAtIndex:section];
    NSString *keyStr = [[dic allKeys]objectAtIndex:0];
    NSArray *arr = [dic objectForKey:keyStr];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier =@"TableViewCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    NSDictionary *dic = [self.dataArr objectAtIndex:indexPath.section];
    NSString *keyStr = [[dic allKeys]objectAtIndex:0];
    NSArray *arr = [dic objectForKey:keyStr];
    cell.textLabel.text = arr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld %ld",indexPath.section, indexPath.row);
    NSString *fountionName = [NSString stringWithFormat:@"didSelectRowAction%ld_%ld", indexPath.section, indexPath.row];
//    SEL mySelector = NSSelectorFromString(fountionName);
//    [self performSelector:mySelector];
    
    if ([self respondsToSelector:NSSelectorFromString(fountionName)])
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:NSSelectorFromString(fountionName)];
#pragma clang diagnostic pop
    }
    else
    {
        NSLog(@"别急，还没实现呢~");
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *dic = [self.dataArr objectAtIndex:section];
    return [[dic allKeys]objectAtIndex:0];
}

- (void)rightBarButtonItemAction
{
    NSLog(@"这是一个说明");
}


#pragma mark - Notification event


#pragma mark - UI drawing


#pragma mark - UI event
- (void)didSelectRowAction0_0
{
    NSLog(@"00");
}

- (void)didSelectRowAction0_1
{
    NSLog(@"01");

}

- (void)didSelectRowAction0_2
{
    NSLog(@"02");

}

- (void)didSelectRowAction0_3
{
    NSLog(@"03");

}

- (void)didSelectRowAction0_4
{
    NSLog(@"04");
}


//ReactiveCocoa
- (void)didSelectRowAction9_1
{
    NSLog(@"ReactiveCocoa");
}




@end
