//
//  RootViewController.m
//  LCSilderViewController
//
//  Created by 刘超 on 15/7/9.
//  Copyright (c) 2015年 刘超. All rights reserved.
//

#import "RootViewController.h"
#define slidingDistance 300
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	_centerController = (UITabBarController *)[storyboard instantiateViewControllerWithIdentifier:@"mainTabBar"];
	_leftController = (UINavigationController *)[storyboard instantiateViewControllerWithIdentifier:@"leftNav"];
	_rightController = (UINavigationController *)[storyboard instantiateViewControllerWithIdentifier:@"rightNav"];
	
	[self.view addSubview:_centerController.view];
	[_centerController.view setTag:1];
	[_centerController.view setFrame:self.view.bounds];
	
	[self.view addSubview:_leftController.view];
	[_leftController.view setTag:2];
	[_leftController.view setFrame:self.view.bounds];
	
	[self.view addSubview:_rightController.view];
	[_rightController.view setTag:3];
	[_rightController.view setFrame:self.view.bounds];
	
	[self.view bringSubviewToFront:_centerController.view];
	
	//add swipe gesture
	UISwipeGestureRecognizer *swipeGestureRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
	[swipeGestureRight setDirection:UISwipeGestureRecognizerDirectionRight];
	[_centerController.view addGestureRecognizer:swipeGestureRight];
	
	UISwipeGestureRecognizer *swipeGestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
	[swipeGestureLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
	[_centerController.view addGestureRecognizer:swipeGestureLeft];
	
	[[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(sidebarOpenOrClose:) name:@"sidebarOpenOrClose" object:nil];
	
	_isShow=YES;
    // Do any additional setup after loading the view.
}

-(void) swipeGesture:(UISwipeGestureRecognizer *)swipeGestureRecognizer {
	
	CALayer *layer = [_centerController.view layer];
	layer.shadowColor = [UIColor blackColor].CGColor;
	layer.shadowOffset = CGSizeMake(1, 1);
	layer.shadowOpacity = 1;
	layer.shadowRadius = 20.0;
	if (swipeGestureRecognizer.direction == UISwipeGestureRecognizerDirectionRight) {
		_isShow=NO;
		[_leftController.view setHidden:NO];
		[_rightController.view setHidden:YES];
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
		if (_centerController.view.frame.origin.x == self.view.frame.origin.x || _centerController.view.frame.origin.x == -slidingDistance) {
			[_centerController.view setFrame:CGRectMake(_centerController.view.frame.origin.x+slidingDistance, _centerController.view.frame.origin.y, _centerController.view.frame.size.width, _centerController.view.frame.size.height)];
		}
		
		[UIView commitAnimations];
	}
	if (swipeGestureRecognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
		_isShow=YES;
		[_rightController.view setHidden:NO];
		[_leftController.view setHidden:YES];
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
		if (_centerController.view.frame.origin.x == self.view.frame.origin.x || _centerController.view.frame.origin.x == slidingDistance) {
			[_centerController.view setFrame:CGRectMake(_centerController.view.frame.origin.x-slidingDistance, _centerController.view.frame.origin.y, _centerController.view.frame.size.width, _centerController.view.frame.size.height)];
		}
		
		[UIView commitAnimations];
	}
}

- (void)sidebarOpenOrClose:(NSNotification*) notification{
	CALayer *layer = [_centerController.view layer];
	layer.shadowColor = [UIColor blackColor].CGColor;
	layer.shadowOffset = CGSizeMake(1, 1);
	layer.shadowOpacity = 1;
	layer.shadowRadius = 20.0;
	if (_isShow) {
		_isShow=NO;
		[_leftController.view setHidden:NO];
		[_rightController.view setHidden:YES];
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
		if (_centerController.view.frame.origin.x == self.view.frame.origin.x || _centerController.view.frame.origin.x == -slidingDistance) {
			[_centerController.view setFrame:CGRectMake(_centerController.view.frame.origin.x+slidingDistance, _centerController.view.frame.origin.y, _centerController.view.frame.size.width, _centerController.view.frame.size.height)];
		}
		
		[UIView commitAnimations];
	}else{
		_isShow=YES;
		
		[_rightController.view setHidden:NO];
		[_leftController.view setHidden:YES];
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
		if (_centerController.view.frame.origin.x == self.view.frame.origin.x || _centerController.view.frame.origin.x == slidingDistance) {
			[_centerController.view setFrame:CGRectMake(_centerController.view.frame.origin.x-slidingDistance, _centerController.view.frame.origin.y, _centerController.view.frame.size.width, _centerController.view.frame.size.height)];
		}
		
		[UIView commitAnimations];
	}
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
