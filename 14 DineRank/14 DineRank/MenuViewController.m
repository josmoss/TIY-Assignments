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
    
    return [self.theRestaurant.dishesArray count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DishTableViewCell *cell = (DishTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"DishCell" forIndexPath:indexPath];
    
    Dish *theDishes = [self.theRestaurant.dishesArray objectAtIndex:indexPath.row];
    
    cell.dishLabel.text = theDishes.dishName;
    
//    cell.DishImageView.image = [UIImage imageNamed:theDish.imageNameString];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.listDishes = [self.theRestaurant.dishesArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"RateSegue" sender:nil];
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    [self performSegueWithIdentifier:@"RateSegue" sender:nil];
}

@end
