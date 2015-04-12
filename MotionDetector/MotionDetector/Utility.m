//
//  Utility.m
//  MotionDetector
//
//  Created by Masakiyo on 2015/03/28.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (UIDeviceOrientation)deviceOrientation {
	return [[UIDevice currentDevice] orientation];
}

+ (NSString *)stringWithDeviceOrientation:(UIDeviceOrientation)orientation {
	NSString *string = nil;
	
	// UIDeviceOrientationUnknown,
	// UIDeviceOrientationPortrait,            // Device oriented vertically, home button on the bottom
	// UIDeviceOrientationPortraitUpsideDown,  // Device oriented vertically, home button on the top
	// UIDeviceOrientationLandscapeLeft,       // Device oriented horizontally, home button on the right
	// UIDeviceOrientationLandscapeRight,      // Device oriented horizontally, home button on the left
	// UIDeviceOrientationFaceUp,              // Device oriented flat, face up
	// UIDeviceOrientationFaceDown             // Device oriented flat, face down
	switch (orientation) {
		case UIDeviceOrientationUnknown:
			string = @"Unknown";
			break;
		case UIDeviceOrientationPortrait:
			string = @"Portrait";
			break;
		case UIDeviceOrientationPortraitUpsideDown:
			string = @"PortraitUpsideDown";
			break;
		case UIDeviceOrientationLandscapeLeft:
			string = @"LandscapeLeft";
			break;
		case UIDeviceOrientationLandscapeRight:
			string = @"LandscapeRight";
			break;
		case UIDeviceOrientationFaceUp:
			string = @"FaceUp";
			break;
		case UIDeviceOrientationFaceDown:
			string = @"FaceDown";
			break;
		default:
			;
	}
	
	return string;
}

@end
