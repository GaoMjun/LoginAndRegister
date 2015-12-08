//
//  StartViewController.m
//  LogAndRegister
//
//  Created by ll on 11/7/15.
//  Copyright © 2015 ll. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (id) init
{
    self = [super init];
    if (self)
    {

    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_toLoginButtonOutlet.layer setMasksToBounds:YES];
    [_toLoginButtonOutlet.layer setCornerRadius:15];
    [_toLoginButtonOutlet.layer setBorderWidth:2];
    [_toLoginButtonOutlet.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor blueColor])];
    
    [_toRegisterButtonOutlet.layer setMasksToBounds:YES];
    [_toRegisterButtonOutlet.layer setCornerRadius:15];
    [_toRegisterButtonOutlet.layer setBorderWidth:2];
    [_toRegisterButtonOutlet.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor blueColor])];
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)toLoginButtonAction:(id)sender {
}

- (IBAction)toRegisterButtonAction:(id)sender {
}

@end
