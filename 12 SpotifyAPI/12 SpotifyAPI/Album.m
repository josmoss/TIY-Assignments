//
//  Album.m
//  12 SpotifyAPI
//
//  Created by Joe Moss on 6/7/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "Album.h"

@implementation Album

#pragma mark - method
-(instancetype) initWithDictionary:(NSDictionary *)dict {
    
    if ( (self = [super init])) {
        //NSLog(@"dict == %@",dict);
        
        //NSLog(@"name == %@",[itemDict valueForKey:@"name"]);
        
        self.name = [dict valueForKey:@"name"];
        
        //NSLog(@"id == %@",[itemDict valueForKey:@"id"]);
        
        self.albumId = [dict valueForKey:@"id"];
        
    }
    
    return self;
    
}

@end
