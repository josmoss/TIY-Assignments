//
//  Character.m
//  07 Star Wars
//
//  Created by Joe Moss on 5/31/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "StarWarsCharacter.h"

@implementation StarWarsCharacter

-(instancetype)initWithName:(NSString *)n spaceShip:(NSString *)s {
    
    if ( self = [super init] ) {
        self.name = n;
        self.spaceship = s;
    }
    return self;
    
}

@end
