//
//  MenuViewController.m
//  14 DineRank
//
//  Created by Joe Moss on 6/9/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//


#import "MenuViewController.h"
#import "DishTableViewCell.h"
#import "RestaurantViewController.h"
#import "RateDishViewController.h"
#import "Restaurant.h"
#import "Dish.h"

@interface MenuViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *restaurantsArray;
@property (nonatomic, strong) NSMutableArray *dishesArray;
@property (nonatomic, strong) Dish *listDishes;
@property (nonatomic, strong) UIImage *theImage;

@end

@implementation MenuViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if(self.theRestaurant != nil) {
        
        NSLog(@"name == %@", self.theRestaurant.name);
        
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.restaurantsArray count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DishTableViewCell *cell = (DishTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"DishCell" forIndexPath:indexPath];
    
    Restaurant *theDishes = [self.restaurantsArray objectAtIndex:indexPath.row];
    
//    cell.restaurantLabel.text = theDishes.name;
//    
//    cell.restaurantImageView.image = [UIImage imageNamed:theRestaurant.imageNameString];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.listDishes = [self.dishesArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"RateSegue" sender:nil];
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    [self performSegueWithIdentifier:@"RateSegue" sender:nil];
}

@end
