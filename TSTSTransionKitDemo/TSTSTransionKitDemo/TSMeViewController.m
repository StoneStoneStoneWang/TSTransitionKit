//
//  TSMeViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSMeViewController.h"
#import "TSBaseViewController+TS_Transition.h"
#import "TSUserInfoViewController.h"
@interface TSMeViewController () <UITableViewDelegate ,UITableViewDataSource>

@end

@implementation TSMeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self get_Ts_naviController] setNavigationBarHidden:true];
}


- (void)configOwnSubviews {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    
    tableView.dataSource = self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"row === %ld",indexPath.row];
    
    return cell;
}
// 注意cell的选中状态

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    TSUserInfoViewController *userInfo = [TSUserInfoViewController new];
    
    [[self get_Ts_naviController] pushViewController:userInfo animated:true];
}
- (BOOL)ts_prefersNavigationBarHidden {
    
    return true;
}
- (BOOL)ts_prefersTabbarHidden {
    
    return false;
}
@end
