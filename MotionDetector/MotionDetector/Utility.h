//
//  Utility.h
//  MotionDetector
//
//  Created by Masakiyo on 2015/03/28.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface Utility : NSObject

+ (UIDeviceOrientation)deviceOrientation;
+ (NSString *)stringWithDeviceOrientation:(UIDeviceOrientation)orientation;

@end
