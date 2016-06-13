//
//  HomeViewController.m
//  14 DineRank
//
//  Created by Joe Moss on 6/9/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *restaurantsButton;
@property (weak, nonatomic) IBOutlet UIButton *aboutButton;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)restaurantTapped:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"RestaurantSegue" sender:nil];
    
}

- (IBAction)aboutTapped:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"AboutSegue" sender:nil];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
}

@end
