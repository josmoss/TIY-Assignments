//
//  ProfileViewController.m
//  07 Star Wars
//
//  Created by Joe Moss on 5/31/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *spaceshipLabel;

@end

@implementation ProfileViewController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.nameLabel.text = self.theCharacter.name;
    self.spaceshipLabel.text = self.theCharacter.spaceship;
    
}

@end
