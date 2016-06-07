//
//  IndyCharacter.h
//  10 Raiders Lost App
//
//  Created by Joe Moss on 6/6/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IndyCharacter : NSObject

-(instancetype)initWithDictionary:(NSDictionary *)dict;

@property (nonatomic, strong) NSString *charName;
@property (nonatomic, strong) NSString *firstmovieappeared;
@property (nonatomic, strong) NSString *liveordie;

@end
