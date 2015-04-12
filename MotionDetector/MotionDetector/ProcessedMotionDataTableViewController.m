//
//  ProcessedMotionDataTableViewController.m
//  MotionDetector
//
//  Created by Masakiyo on 2015/03/29.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import "ProcessedMotionDataTableViewController.h"

@interface ProcessedMotionDataTableViewController ()

@end

@implementation ProcessedMotionDataTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
	
	if (indexPath.section == 0) {
		switch (indexPath.row) {
			case 0:
				cell.detailTextLabel.text = self.deviceMotionAvailable ? @"YES" : @"NO";
				break;
		}
	} else if (indexPath.section == 1) {
		switch (indexPath.row) {
			case 0:
				// 加速度 X
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.gravity.x];
				break;
			case 1:
				// 加速度 Y
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.gravity.y];
				break;
			case 2:
				// 加速度 Z
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.gravity.z];
				break;
		}
	} else if (indexPath.section == 2) {
		switch (indexPath.row) {
			case 0:
				// 加速度 X
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.userAcceleration.x];
				break;
			case 1:
				// 加速度 Y
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.userAcceleration.y];
				break;
			case 2:
				// 加速度 Z
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.userAcceleration.z];
				break;
		}
	} else if (indexPath.section == 3) {
		switch (indexPath.row) {
			case 0:
				// 回転速度 X
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationRate.x];
				break;
			case 1:
				// 回転速度 Y
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationRate.y];
				break;
			case 2:
				// 回転速度 Z
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationRate.z];
				break;
		}
	} else if (indexPath.section == 4) {
		switch (indexPath.row) {
			case 0:
				// 磁力 X
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.magneticField.x];
				break;
			case 1:
				// 磁力 Y
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.magneticField.y];
				break;
			case 2:
				// 磁力 Z
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.magneticField.z];
				break;
		}
	} else if (indexPath.section == 5) {
		switch (indexPath.row) {
			case 0:
				// クォータニオン X
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.quaternion.x];
				break;
			case 1:
				// クォータニオン Y
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.quaternion.y];
				break;
			case 2:
				// クォータニオン Z
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.quaternion.z];
				break;
			case 3:
				// クォータニオン W
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.quaternion.w];
				break;
		}
	} else if (indexPath.section == 6) {
		switch (indexPath.row) {
			case 0:
				// 回転行列 m11
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationMatrix.m11];
				break;
			case 1:
				// 回転行列 m12
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationMatrix.m12];
				break;
			case 2:
				// 回転行列 m13
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationMatrix.m13];
				break;
			case 3:
				// 回転行列 m21
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationMatrix.m21];
				break;
			case 4:
				// 回転行列 m22
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationMatrix.m22];
				break;
			case 5:
				// 回転行列 m23
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationMatrix.m23];
				break;
			case 6:
				// 回転行列 m31
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationMatrix.m31];
				break;
			case 7:
				// 回転行列 m32
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationMatrix.m32];
				break;
			case 8:
				// 回転行列 m33
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationMatrix.m33];
				break;
		}
	} else if (indexPath.section == 7) {
		switch (indexPath.row) {
			case 0:
				// オイラー角 roll
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.roll];
				break;
			case 1:
				// オイラー角 ptich
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.pitch];
				break;
			case 2:
				// オイラー角 yaw
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.yaw];
				break;
		}
	}
	
	return cell;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)updateInfo {
	[self.tableView reloadData];
}

@end
