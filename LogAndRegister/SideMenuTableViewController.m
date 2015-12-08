//
//  SideMenuTableViewController.m
//  slidemenu
//
//  Created by ll on 11/5/15.
//  Copyright © 2015 ll. All rights reserved.
//

#import "SideMenuTableViewController.h"
#import "UserTableViewCell.h"

@interface SideMenuTableViewController ()

@end

@implementation SideMenuTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = @[@"hahaha",
              @"lalala"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return [_array count];
    }
}

//- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 20;
//}
//
//- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 20;
//}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 120;
    } else {
        return 50;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    if (indexPath.section == 0) {
        UserTableViewCell *usercell = [tableView dequeueReusableCellWithIdentifier:@"userCellID" forIndexPath:indexPath];
        return usercell;
    } else {
        NSString *cellID = _array[indexPath.row];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        
        cell.textLabel.text = _array[indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UserTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    } else {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if( [segue isKindOfClass: [SWRevealViewControllerSegue class]] )
//    {
//        SWRevealViewControllerSegue swSegue = (SWRevealViewControllerSegue) segue;
//        swSegue.performBlock = ^ (SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc){
//            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
//            [navController setViewControllers:@[dvc] animated: NO];
//            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
//        };
//    }
}


- (IBAction)logoutButtonAction:(id)sender
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"weiqi_username"];
    [userDefaults removeObjectForKey:@"weiqi_password"];
    [userDefaults synchronize];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    id view = [storyboard instantiateViewControllerWithIdentifier:@"startNavigationView"];
    [self presentViewController:view animated:YES completion:^{
        //
    }];
}
@end








