//
//  MotionTableViewController.h
//  MotionDetector
//
//  Created by Masakiyo on 2015/03/29.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MotionTableViewController : UITableViewController

@property (nonatomic) UIDeviceOrientation deviceOrientation;
@property (nonatomic) NSUInteger numberOfShake;
@property (nonatomic) BOOL altimeterAvailable;
@property (nonatomic) BOOL stepCountingAvailable;
@property (nonatomic) BOOL floorCountingAvailable;
@property (nonatomic) BOOL distanceAvailable;

- (void)updateInfo;

@end
