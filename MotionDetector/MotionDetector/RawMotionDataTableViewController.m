//
//  RawMotionDataTableViewController.m
//  MotionDetector
//
//  Created by Masakiyo on 2015/03/28.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import "RawMotionDataTableViewController.h"
#import "Utility.h"

@interface RawMotionDataTableViewController ()

@end

@implementation RawMotionDataTableViewController

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
				cell.detailTextLabel.text = self.accelerometerAvailable ? @"YES" : @"NO";
				break;
			case 1:
				// 加速度 X
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.acceleration.x];
				break;
			case 2:
				// 加速度 Y
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.acceleration.y];
				break;
			case 3:
				// 加速度 Z
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.acceleration.z];
				break;
		}
	} else if (indexPath.section == 1) {
		switch (indexPath.row) {
			case 0:
				cell.detailTextLabel.text = self.gyroAvailable ? @"YES" : @"NO";
				break;
			case 1:
				// 回転速度 X
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationRate.x];
				break;
			case 2:
				// 回転速度 Y
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationRate.y];
				break;
			case 3:
				// 回転速度 Z
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.rotationRate.z];
				break;
		}
	} else if (indexPath.section == 2) {
		switch (indexPath.row) {
			case 0:
				cell.detailTextLabel.text = self.magnetometerAvailable ? @"YES" : @"NO";
				break;
			case 1:
				// 磁力 X
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.magneticField.x];
				break;
			case 2:
				// 磁力 Y
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.magneticField.y];
				break;
			case 3:
				// 磁力 Z
				cell.detailTextLabel.text = [NSString stringWithFormat:@"%lf", self.magneticField.z];
				break;
		}
	}
	
    return cell;
}

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
