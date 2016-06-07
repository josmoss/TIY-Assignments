//
//  IndyCharacter.m
//  10 Raiders Lost App
//
//  Created by Joe Moss on 6/6/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "IndyCharacter.h"

@implementation IndyCharacter

-(instancetype)initWithDictionary:(NSDictionary *)dict {
    if ( self = [super init] ) {
        self.charName = [dict objectForKey:@"charName"];
        self.firstmovieappeared = [dict objectForKey:@"firstmovieappeared"];
        self.liveordie = [dict objectForKey:@"liveordie"];
    }
    return self;
}

@end
