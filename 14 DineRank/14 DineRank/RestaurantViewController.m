//
//  RestaurantViewController.m
//  14 DineRank
//
//  Created by Joe Moss on 6/9/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//


#import "RestaurantViewController.h"
#import "RestaurantTableViewCell.h"
#import "MenuViewController.h"
#import "RateDishViewController.h"
#import "Restaurant.h"
#import "Dish.h"

@interface RestaurantViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *restaurantsArray;
@property (nonatomic, strong) NSMutableArray *dishesArray;
@property (nonatomic, strong) Restaurant *listRestaurants;
@property (nonatomic, strong) UIImage *theImage;

@end

@implementation RestaurantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadJSONFile];
    
}

- (void)loadJSONFile {
    
    self.restaurantsArray = [[NSMutableArray alloc] init];
    self.dishesArray = [[NSMutableArray alloc] init];
    
    NSDictionary *theDictionary = [self parseJSONFile];
    
    NSLog(@"theDict == %@", theDictionary);
    
    // Create the Array
    NSArray *jsonArray = [theDictionary objectForKey:@"restaurants"];
    
    // Loop through array
    for(NSDictionary *dict in jsonArray) {
        
        // Parsing into Resturant Objects
        
        Restaurant *theRestaurant = [[Restaurant alloc] init];
        
        // Error Checking Way
        
        NSString *name = [dict objectForKey:@"name"];
        
        if(name != nil) {
            theRestaurant.name = name;
        } else {
            theRestaurant.name =@"";
            NSLog(@"I could not parse the name");
        }
        
        NSString *restDescription = [dict objectForKey:@"description"];
        
        if(restDescription != nil) {
            theRestaurant.restDescription = restDescription;
        } else {
            theRestaurant.restDescription =@"";
            NSLog(@"I could not parse the description");
        }
        
        NSString *imageNameString = [dict objectForKey:@"imageNameString"];
        
        if(imageNameString != nil) {
            theRestaurant.imageNameString = imageNameString;
        } else {
            theRestaurant.imageNameString =@"";
            NSLog(@"I could not parse the image name");
        }
        
        NSString *address = [dict objectForKey:@"address"];
        
        if(address != nil) {
            theRestaurant.address = address;
        } else {
            theRestaurant.address =@"";
            NSLog(@"I could not parse the address");
        }
        
        NSString *city = [dict objectForKey:@"city"];
        
        if(city != nil) {
            theRestaurant.city = city;
        } else {
            theRestaurant.city =@"";
            NSLog(@"I could not parse the city");
        }
        
        NSString *state = [dict objectForKey:@"state"];
        
        if(state != nil) {
            theRestaurant.state = state;
        } else {
            theRestaurant.state =@"";
            NSLog(@"I could not parse the state");
        }
        
        NSString *zip = [dict objectForKey:@"zip"];
        
        if(zip != nil) {
            theRestaurant.zip = zip;
        } else {
            theRestaurant.zip =@"";
            NSLog(@"I could not parse the zip");
        }
        
        NSNumber *latitude = [dict objectForKey:@"latitude"];
        
        if(latitude != nil) {
            theRestaurant.latitude = latitude;
        } else {
            NSLog(@"I could not parse the latitude");
        }
        
        NSNumber *longitude = [dict objectForKey:@"longitude"];
        
        if(longitude != nil) {
            theRestaurant.longitude = longitude;
        } else {
            NSLog(@"I could not parse the longitude");
        }
        
        NSString *menuName = [dict objectForKey:@"menuName"];
        
        if(menuName != nil) {
            theRestaurant.menuName = menuName;
        } else {
            theRestaurant.menuName =@"";
            NSLog(@"I could not parse the menu name");
        }
        
        NSArray *dishesArray = [dict objectForKey:@"dishes"];
        
        for(NSDictionary *dict in dishesArray) {
            
            Dish *theDish = [[Dish alloc] init];
            
            NSString *dishName = [dict objectForKey:@"name"];
            
            if(dishName != nil) {
                theDish.dishName = dishName;
            } else {
                theDish.dishName =@"";
                NSLog(@"I could not parse the dish name");
            }
            
            NSString *dishDescription = [dict objectForKey:@"description"];
            
            if(dishDescription != nil) {
                theDish.dishDescription = dishDescription;
            } else {
                theDish.dishDescription =@"";
                NSLog(@"I could not parse the dish description");
            }
            
            NSNumber *rating = [dict objectForKey:@"rating"];
            
            if(rating != nil) {
                theDish.rating = rating;
            } else {
                NSLog(@"I could not parse the rating");
            }
            
            NSString *dishImageName = [dict objectForKey:@"imageNameString"];
            
            if(dishImageName != nil) {
                theDish.dishImageName = dishImageName;
            } else {
                theDish.dishImageName =@"";
                NSLog(@"I could not parse the dish image name");
            }
            
            NSNumber *price = [dict objectForKey:@"price"];
            
            if(price != nil) {
                theDish.price = price;
            } else {
                NSLog(@"I could not parse the price");
            }
            
            [self.dishesArray addObject:theDish];
        }
        
        [self.restaurantsArray addObject:theRestaurant];
        
        
        //NSLog(@"name: %@", [dict objectForKey:@"name"]);
        //NSLog(@"latitude: %@", [dict objectForKey:@"latitude"]);
        
        //    NSLog(@"the number of restaurants is %ld", self.restaurantsArray.count);
        
        // Looping self.restaurants
        for(Restaurant *r in self.restaurantsArray) {
            
            NSLog(@"The restaurant name is %@", r.name);
            NSLog(@"The description is %@", r.restDescription);
            NSLog(@"The image name is %@", r.imageNameString);
            NSLog(@"The address name is %@", r.address);
            NSLog(@"The city is %@", r.city);
            NSLog(@"The state is %@", r.state);
            NSLog(@"The zip is %@", r.zip);
            NSLog(@"The latitude is %@", r.latitude);
            NSLog(@"The longitude is %@", r.latitude);
            NSLog(@"The menu name is %@", r.menuName);
            
        }
        
        for(Dish *d in self.dishesArray) {
            
            NSLog(@"The dish name is %@", d.dishName);
            NSLog(@"The dish description is %@", d.dishDescription);
            NSLog(@"The rating is %@", d.rating);
            NSLog(@"The dish image name is %@", d.dishImageName);
            NSLog(@"The price is %@", d.price);
            
        }
        
    }
    
}

-(NSDictionary *)parseJSONFile {
    
    NSDictionary *jsonDictionary = nil;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"restaurantData" ofType:@"json"];
    
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    if (data == nil) {
        NSLog(@"There is a problem converting to data");
    } else {
        
        NSError *jsonError = nil;
        
        jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                         options:NSJSONReadingAllowFragments
                                                           error:&jsonError];
        
        if(jsonError == nil) {
            // we are good
            // NSLog(@"jsonDictionary == %@", jsonDictionary);
        } else {
            // error
            NSLog(@"An error occurred %@", jsonError.localizedDescription);
            
        }
        
    }
    
    return jsonDictionary;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.restaurantsArray count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RestaurantTableViewCell *cell = (RestaurantTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"RestaurantCell" forIndexPath:indexPath];
    
    Restaurant *theRestaurant = [self.restaurantsArray objectAtIndex:indexPath.row];
    
    cell.restaurantLabel.text = theRestaurant.name;
    
    cell.restaurantImageView.image = [UIImage imageNamed:theRestaurant.imageNameString];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.listRestaurants = [self.restaurantsArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"MenuSegue" sender:nil];
    
}

#pragma mark - Navigation Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"MenuSegue"]) {
        
        MenuViewController *controller = (MenuViewController *) segue.destinationViewController;
        
        controller.theRestaurant = self.listRestaurants;
        
    }
    
}

@end
