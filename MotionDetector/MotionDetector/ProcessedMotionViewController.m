//
//  ProcessedMotionViewController.m
//  MotionDetector
//
//  Created by Masakiyo on 2015/03/28.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "AppDelegate.h"
#import "ProcessedMotionViewController.h"
#import "ProcessedMotionDataTableViewController.h"
#import "Utility.h"

@interface ProcessedMotionViewController ()

@property (nonatomic, weak) ProcessedMotionDataTableViewController *processedMotionDataTableViewController;
@property (nonatomic) BOOL pullMotionDataActive;

@end

@implementation ProcessedMotionViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[self startPullMotionData];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	
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
		
		// デバイスモーションデータをプル型で取得
		if ([motionManager isDeviceMotionAvailable]) {
			motionManager.deviceMotionUpdateInterval = interval;
			
			// 参照フレームはattitudeReferenceFrameプロパティ
			//[motionManager startDeviceMotionUpdates];
			
			// 参照フレームを指定する
			// CMAttitudeReferenceFrameXArbitraryZVertical : Z軸を鉛直として、X軸を横とする(FaceUp)
			// CMAttitudeReferenceFrameXArbitraryCorrectedZVertical : 上記に加えて、電子コンパスで位置を修正する(ただし、上記のものよりもCPUを消費する) magneticField利用可
			// CMAttitudeReferenceFrameXMagneticNorthZVertical : Z軸を鉛直として、X軸を横とする。その際、電子コンパスを利用して、X軸を"磁北"に設定 magneticField利用可
			// CMAttitudeReferenceFrameXTrueNorthZVertical : Z軸を鉛直として、X軸を横とする。その際、GPSと電子コンパスを利用して、X軸を"真北"に設定 magneticField利用可
			motionManager.showsDeviceMovementDisplay = YES;
			[motionManager startDeviceMotionUpdatesUsingReferenceFrame:CMAttitudeReferenceFrameXMagneticNorthZVertical];
		}
		
		while (self.pullMotionDataActive) {
			
			dispatch_async(dispatch_get_main_queue(), ^(void){
				//accelerometerData.timestamp;
				self.processedMotionDataTableViewController.deviceMotionAvailable = [motionManager isDeviceMotionAvailable];
				
				self.processedMotionDataTableViewController.gravity = motionManager.deviceMotion.gravity;
				self.processedMotionDataTableViewController.userAcceleration = motionManager.deviceMotion.userAcceleration;
				self.processedMotionDataTableViewController.rotationRate = motionManager.deviceMotion.rotationRate;
				self.processedMotionDataTableViewController.magneticField = motionManager.deviceMotion.magneticField.field;
				self.processedMotionDataTableViewController.quaternion = motionManager.deviceMotion.attitude.quaternion;
				self.processedMotionDataTableViewController.rotationMatrix = motionManager.deviceMotion.attitude.rotationMatrix;
				self.processedMotionDataTableViewController.roll = motionManager.deviceMotion.attitude.roll;
				self.processedMotionDataTableViewController.pitch = motionManager.deviceMotion.attitude.pitch;
				self.processedMotionDataTableViewController.yaw = motionManager.deviceMotion.attitude.yaw;
				
				[self.processedMotionDataTableViewController updateInfo];
			});
			
			[NSThread sleepForTimeInterval:interval];
		}
		
		[motionManager stopDeviceMotionUpdates];
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
	if ([segueName isEqualToString: @"processedMotionData"]) {
		self.processedMotionDataTableViewController = (ProcessedMotionDataTableViewController *)[segue destinationViewController];
		
		// 表示を更新
		[self.processedMotionDataTableViewController updateInfo];
	}
}

@end
