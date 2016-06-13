//
//  RestaurantTableViewCell.h
//  14 DineRank
//
//  Created by Joe Moss on 6/12/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *restaurantImageView;
@property (weak, nonatomic) IBOutlet UILabel *restaurantLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end
