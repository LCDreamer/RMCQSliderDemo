//
//  RootViewController.h
//  LCSilderViewController
//
//  Created by 刘超 on 15/7/9.
//  Copyright (c) 2015年 刘超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
@interface RootViewController : UIViewController
@property(nonatomic, strong) UITabBarController *centerController;
@property(nonatomic, strong) UINavigationController *rightController;
@property(nonatomic, strong) UINavigationController *leftController;
@property(nonatomic, assign) BOOL isShow;
@end
