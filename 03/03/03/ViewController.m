//
//  ViewController.m
//  03
//
//  Created by Joe Moss on 5/25/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self printGreeting:@"Hello"];
    
    [self printGreetingTo:@"Joe" atTimeofDay:@"Evening"];
    
    NSString *name = [self greetingWithName:@"Joe"];
    NSLog(@"name == %@", name);
    
    NSString *nameFull = [self greetingWithFullName:@"Joe Moss"];
    NSLog(@"nameFull == %@", nameFull);
    
    NSString *timeOfDay = [self greetingAtTimeOfDay:@"Morning"];
    NSLog(@"timeOfDay == %@", timeOfDay);
    
    NSString *bandName, *openBand = [self greetingWithBand:@"Band of Horses" withOpeningBand:@"Iron and Wine"];
    NSLog(@"bandName, openBand == %@ %@", bandName, openBand);
    
//    NSString *nameVehic, *age = [self stringWithName:@"Vehicle" age:@"2010"];
//    NSLog(@"nameVehic, age == %@ %@", nameVehic, age);
    
    NSString *bandName1, *leadSinger, *bassPlayer = [self stringWithBand:@"BOH" withLeadSinger:@"Matt" withBassPlayer:@"Charlie"];
    NSLog(@"bandName1, leadSinger, bassPlayer == %@ %@ %@", bandName1, leadSinger, bassPlayer);
    
}

-(void)printGreeting:(NSString *)greeting {
    NSLog(@"%@", greeting);
    
}

-(void)printGreetingTo:(NSString *)name atTimeofDay:(NSString *)timeOfDayString {
    NSLog(@" %@ %@", name, timeOfDayString);
    
}

-(NSString *)greetingWithName:(NSString *)name {
    return [NSString stringWithFormat:@"Hello, %@", name];
    
}

-(NSString *)greetingWithFullName:(NSString *)nameFull {
    return [NSString stringWithFormat:@"Hello, %@", nameFull];

}

-(NSString *)greetingAtTimeOfDay:(NSString *)timeOfDay {
    return [NSString stringWithFormat:@"%@", timeOfDay];
    
}

-(NSString *)greetingWithBand:(NSString *)bandName withOpeningBand:(NSString *)openBand {
    return [NSString stringWithFormat:@" %@, %@", bandName, openBand];
    
}

//-(NSString *)stringWithName:(NSString *)name age:(float)age {
//    return [NSString stringWithFormat:@" %@, %f", name, age];
//    
//}

-(NSString *)stringWithBand:(NSString *)bandName1 withLeadSinger:(NSString *)leadSinger withBassPlayer:(NSString *)bassPlayer {
    return [NSString stringWithFormat:@" %@, %@, %@", bandName1, leadSinger, bassPlayer];
    
}

@end
