//
//  RawMotionDataTableViewController.h
//  MotionDetector
//
//  Created by Masakiyo on 2015/03/28.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface RawMotionDataTableViewController : UITableViewController

@property (nonatomic) BOOL accelerometerAvailable;
@property (nonatomic) CMAcceleration acceleration;
@property (nonatomic) BOOL gyroAvailable;
@property (nonatomic) CMRotationRate rotationRate;
@property (nonatomic) BOOL magnetometerAvailable;
@property (nonatomic) CMMagneticField magneticField;

- (void)updateInfo;

@end
