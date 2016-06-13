//
//  Dish.h
//  14 DineRank
//
//  Created by Joe Moss on 6/11/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dish : NSObject

@property (nonatomic, strong) NSString *dishName;
@property (nonatomic, strong) NSString *dishDescription;
@property (nonatomic, strong) NSNumber *rating;
@property (nonatomic, strong) NSString *dishImageName;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSMutableArray *dishesArray;

@end
