//
//  ZuoyeTableViewController.m
//  LogAndRegister
//
//  Created by ll on 11/7/15.
//  Copyright © 2015 ll. All rights reserved.
//

#import "ZuoyeTableViewController.h"
#import "SWRevealViewController.h"

@interface ZuoyeTableViewController ()

@end

@implementation ZuoyeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _menuButtonOutlet.target = self.revealViewController;
    _menuButtonOutlet.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    _zuoyeListArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    [_zuoyeListArray addObjectsFromArray:@[@"hahaha",
                        @"lalala",
                        @"bababa"]];
    
    [self refresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_zuoyeListArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"zuoyeCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = _zuoyeListArray[indexPath.row];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)refreshAction:(id)sender
{
    [self refresh];
}

- (void) refresh
{
    [self.refreshControl beginRefreshing];
    
    dispatch_async(dispatch_queue_create("refreshQ", NULL), ^{
        //
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.refreshControl endRefreshing];
        });
    });
}

@end










