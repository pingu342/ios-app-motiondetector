//
//  ProcessedMotionDataTableViewController.h
//  MotionDetector
//
//  Created by Masakiyo on 2015/03/29.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ProcessedMotionDataTableViewController : UITableViewController

@property (nonatomic) BOOL deviceMotionAvailable;
@property (nonatomic) CMAcceleration gravity;
@property (nonatomic) CMAcceleration userAcceleration;
@property (nonatomic) CMRotationRate rotationRate;
@property (nonatomic) CMMagneticField magneticField;
@property (nonatomic) CMQuaternion quaternion;
@property (nonatomic) CMRotationMatrix rotationMatrix;
@property (nonatomic) double roll;
@property (nonatomic) double pitch;
@property (nonatomic) double yaw;

- (void)updateInfo;

@end
