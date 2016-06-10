//
//  LoginViewController.m
//  14 DineRank
//
//  Created by Joe Moss on 6/9/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *authenticateButton;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}
- (IBAction)authenticateTapped:(UIButton *)sender {
    
    if ([self.userTextField.text isEqualToString:@"Joe"] && [self.passwordTextField.text isEqualToString:@"password"]) {
        
        [self performSegueWithIdentifier:@"HomeSegue" sender:nil];
        
    } else {
        
        
    }
    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
