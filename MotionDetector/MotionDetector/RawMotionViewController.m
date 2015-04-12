//
//  RawMotionViewController.m
//  MotionDetector
//
//  Created by Masakiyo on 2015/03/28.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "AppDelegate.h"
#import "RawMotionViewController.h"
#import "RawMotionDataTableViewController.h"
#import "Utility.h"

@interface RawMotionViewController ()

@property (nonatomic, weak) RawMotionDataTableViewController *rawMotionDataTableViewController;
@property (nonatomic) BOOL pullMotionDataActive;

@end

@implementation RawMotionViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	// モーションデータの取得開始
	[self startPullMotionData];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];

	// モーションデータの取得終了
	[self stopPullMotionData];
}

- (void)startPullMotionData {
	self.pullMotionDataActive = YES;
	[NSThread detachNewThreadSelector:@selector(pullMotionDataThreadMainMethod) toTarget:self withObject:nil];
}

- (void)pullMotionDataThreadMainMethod {
	
	@autoreleasepool {
		CMMotionManager *motionManager = [(AppDelegate *)[[UIApplication sharedApplication] delegate] sharedMotionManager];
		NSTimeInterval interval = 1./10.;
		
		// 加速度データをプル型で取得開始
		if ([motionManager isAccelerometerAvailable]) {
			motionManager.accelerometerUpdateInterval = 0.1; //10Hz
			[motionManager startAccelerometerUpdates];
		}
		
		// 回転速度データをプル型で取得開始
		if ([motionManager isGyroAvailable]) {
			motionManager.gyroUpdateInterval = interval;
			[motionManager startGyroUpdates];
		}
		
		// 磁力データをプル型で取得開始
		if ([motionManager isMagnetometerAvailable]) {
			motionManager.magnetometerUpdateInterval = interval;
			[motionManager startMagnetometerUpdates];
		}
		
		while (self.pullMotionDataActive) {
			
			dispatch_async(dispatch_get_main_queue(), ^(void){
				//accelerometerData.timestamp;
				self.rawMotionDataTableViewController.accelerometerAvailable = [motionManager isAccelerometerAvailable];
				self.rawMotionDataTableViewController.gyroAvailable = [motionManager isGyroAvailable];
				self.rawMotionDataTableViewController.magnetometerAvailable = [motionManager isMagnetometerAvailable];
				
				// 加速度データ
				self.rawMotionDataTableViewController.acceleration = motionManager.accelerometerData.acceleration;
				
				// 回転速度データ
				self.rawMotionDataTableViewController.rotationRate = motionManager.gyroData.rotationRate;
				
				// 磁力データ
				self.rawMotionDataTableViewController.magneticField = motionManager.magnetometerData.magneticField;
				
				// 表示を更新
				[self.rawMotionDataTableViewController updateInfo];
			});
			
			[NSThread sleepForTimeInterval:interval];
		}
		
		[motionManager stopAccelerometerUpdates];
		[motionManager stopGyroUpdates];
		[motionManager stopMagnetometerUpdates];
	}
	
}

- (void)stopPullMotionData {
	self.pullMotionDataActive = NO;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	NSString * segueName = segue.identifier;
	if ([segueName isEqualToString: @"rawMotionData"]) {
		self.rawMotionDataTableViewController = (RawMotionDataTableViewController *)[segue destinationViewController];
		
		// 表示を更新
		[self.rawMotionDataTableViewController updateInfo];
	}
}

@end
