//
//  ViewController.m
//  MotionDetector
//
//  Created by Masakiyo on 2015/03/28.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "AppDelegate.h"
#import "ViewController.h"
#import "MotionTableViewController.h"
#import "Utility.h"

@interface ViewController ()

@property (nonatomic, weak) MotionTableViewController *motionTableViewController;
@property (nonatomic) BOOL pullMotionDataActive;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	// デバイスの向き変更イベントの受け取りを開始
	[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(orientationChanged:)
												 name:UIDeviceOrientationDidChangeNotification
											   object:nil];
	// モーションイベントのファーストレスポンダを指定
	[self becomeFirstResponder];
	
	// 高度計
	if ([CMAltimeter isRelativeAltitudeAvailable]) {
		CMAltimeter *altimeter = [(AppDelegate *)[[UIApplication sharedApplication] delegate] sharedAltimeter];
		[altimeter startRelativeAltitudeUpdatesToQueue: [NSOperationQueue mainQueue] withHandler:^(CMAltitudeData *altitudeData, NSError *error) {
			NSLog(@"%@", altitudeData);
		}];
	}
	
	// 歩数計
	
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	
	// デバイスの向き変更イベントの受け取りを終了
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
	
	// 高度計
	if ([CMAltimeter isRelativeAltitudeAvailable]) {
		CMAltimeter *altimeter = [(AppDelegate *)[[UIApplication sharedApplication] delegate] sharedAltimeter];
		[altimeter stopRelativeAltitudeUpdates];
	}
}

- (BOOL)canBecomeFirstResponder {
	// モーションイベントのファーストレスポンダを指定
	return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	if (motion == UIEventSubtypeMotionShake) {
		// ユーザがデバイスを振った回数をカウントアップ
		self.motionTableViewController.numberOfShake ++;
		[self.motionTableViewController updateInfo];
	}
}

- (void)orientationChanged:(NSNotification *)notification {
	
	// デバイスの向きを取得	
	self.motionTableViewController.deviceOrientation = [Utility deviceOrientation];
	
	// 表示を更新
	[self.motionTableViewController updateInfo];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	NSString * segueName = segue.identifier;
	if ([segueName isEqualToString: @"basicMotionData"]) {
		self.motionTableViewController = (MotionTableViewController *)[segue destinationViewController];
		
		// 表示を更新
		self.motionTableViewController.deviceOrientation = [Utility deviceOrientation];
		self.motionTableViewController.altimeterAvailable = [CMAltimeter isRelativeAltitudeAvailable];
		self.motionTableViewController.stepCountingAvailable = [CMPedometer isStepCountingAvailable];
		self.motionTableViewController.floorCountingAvailable = [CMPedometer isFloorCountingAvailable];
		self.motionTableViewController.distanceAvailable = [CMPedometer isDistanceAvailable];
		[self.motionTableViewController updateInfo];
	}
}

@end
