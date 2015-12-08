//
//  ResetPasswordViewController.m
//  LogAndRegister
//
//  Created by ll on 11/7/15.
//  Copyright © 2015 ll. All rights reserved.
//

#import "ResetPasswordViewController.h"

@interface ResetPasswordViewController ()

@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_passwordFieldViewOutlet.layer setMasksToBounds:YES];
    [_passwordFieldViewOutlet.layer setCornerRadius:5];
    [_passwordFieldViewOutlet.layer setBorderWidth:2];
    [_passwordFieldViewOutlet.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor blueColor])];
    
    [_passwordAgainFieldViewOutlet.layer setMasksToBounds:YES];
    [_passwordAgainFieldViewOutlet.layer setCornerRadius:5];
    [_passwordAgainFieldViewOutlet.layer setBorderWidth:2];
    [_passwordAgainFieldViewOutlet.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor blueColor])];
    
    [_usernameFieldViewOutlet.layer setMasksToBounds:YES];
    [_usernameFieldViewOutlet.layer setCornerRadius:5];
    [_usernameFieldViewOutlet.layer setBorderWidth:2];
    [_usernameFieldViewOutlet.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor blueColor])];
    
    [_authcodeFieldViewOutlet.layer setMasksToBounds:YES];
    [_authcodeFieldViewOutlet.layer setCornerRadius:5];
    [_authcodeFieldViewOutlet.layer setBorderWidth:2];
    [_authcodeFieldViewOutlet.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor blueColor])];
    
    [_getAuthcodeButtonOutlet.layer setMasksToBounds:YES];
    [_getAuthcodeButtonOutlet.layer setCornerRadius:5];
    [_getAuthcodeButtonOutlet.layer setBorderWidth:2];
    [_getAuthcodeButtonOutlet.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor blueColor])];
    
    [_resetPasswordButtonOutlet.layer setMasksToBounds:YES];
    [_resetPasswordButtonOutlet.layer setCornerRadius:5];
    [_resetPasswordButtonOutlet.layer setBorderWidth:2];
    [_resetPasswordButtonOutlet.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor blueColor])];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)getAuthcodeButtonAction:(id)sender
{
}

- (IBAction)resetPasswordButtonAction:(id)sender
{
    [self.view endEditing:YES];
    
    
}

@end
