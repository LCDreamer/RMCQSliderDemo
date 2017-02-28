//
//  LCTabBarController.m
//  LCSilderViewController
//
//  Created by 刘超 on 15/7/9.
//  Copyright (c) 2015年 刘超. All rights reserved.
//

#import "LCTabBarController.h"

@interface LCTabBarController ()

@end

@implementation LCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.vehicleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	_vehicleBtn.tag=100;
	[_vehicleBtn setFrame:CGRectMake(10, 20, 40, 40)];
	[_vehicleBtn setTitle:NSLocalizedString(@"Vehicle", nil) forState:UIControlStateNormal];
	_vehicleBtn.titleLabel.font = [UIFont systemFontOfSize:11];
	_vehicleBtn.layer.borderWidth = 1;
	_vehicleBtn.layer.borderColor = [UIColor greenColor].CGColor;
	_vehicleBtn.layer.masksToBounds = YES;
	_vehicleBtn.layer.cornerRadius = 20;
	[_vehicleBtn.titleLabel setTextColor:[UIColor greenColor]];
	[_vehicleBtn addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_vehicleBtn];
	
    // Do any additional setup after loading the view.
}

- (void)leftAction:(UIButton *)btn
{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"sidebarOpenOrClose" object:nil
													  userInfo:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
