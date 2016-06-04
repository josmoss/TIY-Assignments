//
//  Movie.m
//  09 JSON
//
//  Created by Joe Moss on 6/3/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "Movie.h"

@implementation Movie

-(instancetype)initWithName:(NSString *)t moviePoster:(NSString *)p {

    if ( self = [super init] ) {
        self.originalTitle = t;
        self.posterPath = p;
    }

    return self;

}

@end
