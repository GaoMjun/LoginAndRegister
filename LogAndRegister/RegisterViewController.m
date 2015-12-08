//
//  RegisterViewController.m
//  LogAndRegister
//
//  Created by ll on 11/7/15.
//  Copyright © 2015 ll. All rights reserved.
//

#import "RegisterViewController.h"
#import <SMS_SDK/SMSSDK.h>
#import "AFNetworking.h"

@interface RegisterViewController ()

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *authcode;

@end

@implementation RegisterViewController

static NSString *registerAPI = @"your register api";
static NSString *zoneCode = @"86";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_passwordFieldViewOutlet.layer setMasksToBounds:YES];
    [_passwordFieldViewOutlet.layer setCornerRadius:5];
    [_passwordFieldViewOutlet.layer setBorderWidth:2];
    [_passwordFieldViewOutlet.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor blueColor])];
    
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
    
    [_registerButtonOutlet.layer setMasksToBounds:YES];
    [_registerButtonOutlet.layer setCornerRadius:5];
    [_registerButtonOutlet.layer setBorderWidth:2];
    [_registerButtonOutlet.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor blueColor])];
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
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
    _username = _usernameTextFieldOutlet.text;
    
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS
                            phoneNumber:_username
                                   zone:zoneCode
                       customIdentifier:nil
                                 result:^(NSError *error) {
                                     if (!error) {
                                         NSLog(@"获取验证码成功");
                                     } else {
                                         NSLog(@"%@ ", [error.userInfo objectForKey:@"getVerificationCode"]);
                                     }
                                 }];
}

- (IBAction)registerButtonAction:(id)sender
{
    [self.view endEditing:YES];
    
    _username = _usernameTextFieldOutlet.text;
    _password = _passwordTextFieldOutlet.text;
    _authcode = _authcodeTextFieldOutlet.text;
    
    [SMSSDK commitVerificationCode:_authcode
                       phoneNumber:_username
                              zone:zoneCode
                            result:^(NSError *error) {
                                if (!error) {
                                    NSLog(@"验证成功");
                                    
                                    if ([_password isEqualToString:@""]) {
                                        NSLog(@"请重新输入用户名密码或验证码");
                                    } else {
                                        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
                                        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
                                        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
                                        [manager POST:registerAPI
                                           parameters:nil
                            constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                                [formData appendPartWithFormData:[_username dataUsingEncoding:NSUTF8StringEncoding] name:@"mobile"];
                                [formData appendPartWithFormData:[_password dataUsingEncoding:NSUTF8StringEncoding] name:@"password"];
                            }
                                              success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                                                  NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                                                  if ([responseStr isEqualToString:@"register sucess"]) {
                                                      //
                                                  } else if ([responseStr isEqualToString:@"user already existed"]) {
                                                      //
                                                  } else {
                                                      NSLog(@"%@ ", responseStr);
                                                  }
                                              }
                                              failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                                                  NSLog(@"%@ ", error);
                                              }];
                                    }
                                } else {
                                    NSLog(@"验证失败");
                                }
                            }];
}
@end








