//
//  Album.h
//  12 SpotifyAPI
//
//  Created by Joe Moss on 6/7/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

-(instancetype) initWithDictionary: (NSDictionary *)dict; 

@property (nonatomic, strong) NSString *albumId;
@property (nonatomic, strong) NSString *name;

@end
