//
//  Restaurant.m
//  14 DineRank
//
//  Created by Joe Moss on 6/11/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

-(instancetype)init {
    
    if ( (self = [super init])) {
        self.dishesArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
