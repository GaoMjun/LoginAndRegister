//
//  StartViewController.h
//  LogAndRegister
//
//  Created by ll on 11/7/15.
//  Copyright © 2015 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *toRegisterButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *toLoginButtonOutlet;

- (IBAction)toLoginButtonAction:(id)sender;
- (IBAction)toRegisterButtonAction:(id)sender;

@end
