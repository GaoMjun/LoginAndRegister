//
//  LoginViewController.h
//  LogAndRegister
//
//  Created by ll on 11/7/15.
//  Copyright © 2015 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *usernameFieldViewOutlet;
@property (weak, nonatomic) IBOutlet UIView *passwordFieldViewOutlet;
@property (weak, nonatomic) IBOutlet UIButton *loginButtonOutlet;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextFieldOutlet;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFieldOutlet;


- (IBAction)loginButtonAction:(id)sender;

@end
