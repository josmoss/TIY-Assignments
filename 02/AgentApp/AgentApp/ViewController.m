//
//  ViewController.m
//  AgentApp
//
//  Created by Joe Moss on 5/24/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
    NSString *agent;

}

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *authenticateButton;
@property (weak, nonatomic) IBOutlet UILabel *greetingLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    agent = @"Moss";
    
}

- (IBAction)authenticateTapped:(UIButton *)sender {
    
    if ([self.usernameTextField.text isEqualToString:@"Joe"] && [self.passwordTextField.text isEqualToString:@"password"]) {
            
        self.view.backgroundColor = [UIColor greenColor];
        
        self.greetingLabel.text = [NSString stringWithFormat:@"Good Afternoon, Agent %@",agent];
        
    } else {
        
        self.view.backgroundColor = [UIColor redColor];
        
    }
    
}

@end
