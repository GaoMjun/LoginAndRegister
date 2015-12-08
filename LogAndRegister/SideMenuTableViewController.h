//
//  SideMenuTableViewController.h
//  slidemenu
//
//  Created by ll on 11/5/15.
//  Copyright © 2015 ll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"

@interface SideMenuTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *array;

- (IBAction)logoutButtonAction:(id)sender;
@end
