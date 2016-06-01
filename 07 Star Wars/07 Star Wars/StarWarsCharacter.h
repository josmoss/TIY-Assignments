//
//  Character.h
//  07 Star Wars
//
//  Created by Joe Moss on 5/31/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StarWarsCharacter : NSObject

-(instancetype)initWithName:(NSString *) name spaceShip:(NSString *)spaceship;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *spaceship;

@end
