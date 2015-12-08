//
//  RegisterViewController.h
//  LogAndRegister
//
//  Created by ll on 11/7/15.
//  Copyright © 2015 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *usernameFieldViewOutlet;
@property (weak, nonatomic) IBOutlet UIView *passwordFieldViewOutlet;
@property (weak, nonatomic) IBOutlet UIView *authcodeFieldViewOutlet;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextFieldOutlet;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFieldOutlet;
@property (weak, nonatomic) IBOutlet UITextField *authcodeTextFieldOutlet;

@property (weak, nonatomic) IBOutlet UIButton *getAuthcodeButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *registerButtonOutlet;

- (IBAction)getAuthcodeButtonAction:(id)sender;
- (IBAction)registerButtonAction:(id)sender;


@end
