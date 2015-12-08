//
//  UserTableViewCell.m
//  slidemenu
//
//  Created by ll on 11/8/15.
//  Copyright © 2015 ll. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

- (void)awakeFromNib {
    _avatarImageOutlet.layer.cornerRadius = 10;
    _avatarImageOutlet.clipsToBounds = YES;
    _avatarImageOutlet.layer.borderWidth = 3;
    _avatarImageOutlet.layer.borderColor = [UIColor whiteColor].CGColor;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefaults objectForKey:@"weiqi_username"];
    
    _usernameOutlet.text = username;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
