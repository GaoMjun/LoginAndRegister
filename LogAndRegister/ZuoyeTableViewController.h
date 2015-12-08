//
//  ZuoyeTableViewController.h
//  LogAndRegister
//
//  Created by ll on 11/7/15.
//  Copyright © 2015 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZuoyeTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *zuoyeListArray;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButtonOutlet;

- (IBAction)refreshAction:(id)sender;
@end
