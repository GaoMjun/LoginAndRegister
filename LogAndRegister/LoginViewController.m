//
//  LoginViewController.m
//  LogAndRegister
//
//  Created by ll on 11/7/15.
//  Copyright © 2015 ll. All rights reserved.
//

#import "LoginViewController.h"
#import "AFNetworking.h"

@interface LoginViewController ()

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;

@end

@implementation LoginViewController

static NSString *loginAPI = @"your login api";

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
    
    [_loginButtonOutlet.layer setMasksToBounds:YES];
    [_loginButtonOutlet.layer setCornerRadius:5];
    [_loginButtonOutlet.layer setBorderWidth:2];
    [_loginButtonOutlet.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor blueColor])];
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

- (IBAction)loginButtonAction:(id)sender
{
    [self.view endEditing:YES];
    
    _username = _usernameTextFieldOutlet.text;
    _password = _passwordTextFieldOutlet.text;
    
    if ([_username isEqualToString:@""] ||
        [_password isEqualToString:@""]) {
        NSLog(@"请重新输入用户名或密码");
    } else {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager POST:loginAPI
           parameters:nil
constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    [formData appendPartWithFormData:[_username dataUsingEncoding:NSUTF8StringEncoding] name:@"mobile"];
    [formData appendPartWithFormData:[_password dataUsingEncoding:NSUTF8StringEncoding] name:@"password"];
    }
              success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                  NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                  if ([responseStr isEqualToString:@"user check pass"]) {
                      NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                      [userDefaults setObject:_username forKey:@"weiqi_username"];
                      [userDefaults setObject:_password forKey:@"weiqi_password"];
                      [userDefaults synchronize];
                      
                      UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                      id mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainView"];
                      [self presentViewController:mainViewController animated:YES completion:^{
                          //
                      }];
                      
                  } else if ([responseStr isEqualToString:@"user not exist"]) {
                      //
                  } else if ([responseStr isEqualToString:@"incorrect password"]) {
                      //
                  } else {
                      NSLog(@"%@ ", responseStr);
                  }
              }
              failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                  NSLog(@"%@ ", error);
              }];
    }
    
}
@end















