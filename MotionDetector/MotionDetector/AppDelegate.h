//
//  AppDelegate.h
//  MotionDetector
//
//  Created by Masakiyo on 2015/03/28.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (CMMotionManager *)sharedMotionManager;
- (CMAltimeter *)sharedAltimeter;

@end

