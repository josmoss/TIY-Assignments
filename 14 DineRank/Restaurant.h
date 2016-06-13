//
//  Restaurant.h
//  14 DineRank
//
//  Created by Joe Moss on 6/11/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *restDescription;
@property (nonatomic, strong) NSString *imageNameString;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *zip;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSString *menuName;
@property (nonatomic, strong) NSMutableArray *dishesArray;

@end
