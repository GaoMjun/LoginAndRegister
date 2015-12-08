//
//  UserTableViewCell.h
//  slidemenu
//
//  Created by ll on 11/8/15.
//  Copyright © 2015 ll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageOutlet;
@property (weak, nonatomic) IBOutlet UILabel *usernameOutlet;
@property (weak, nonatomic) IBOutlet UIButton *logoutButtonOutlet;

@end
