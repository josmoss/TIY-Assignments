//
//  ViewController.m
//  04 Out of Time
//
//  Created by Joe Moss on 5/26/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "OutOfTimeViewController.h"

@interface OutOfTimeViewController () {
 
    int milesPerHour;
}

@property (weak, nonatomic) IBOutlet UITextField *destDateTextBox;
@property (weak, nonatomic) IBOutlet UILabel *presentDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastTimeDeptLabel;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSDateFormatter *formatter;

@end

@implementation OutOfTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
[self.destDateTextBox setValue:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
//    Date Formatter
    self.formatter = [[NSDateFormatter alloc] init];
    self.formatter.dateFormat =@"MMM d, yyyy";

    
//    NSLog(@"today == %@", today);
    
}

- (IBAction)unwindSegue:(UIStoryboardSegue *)sender {
    
    NSLog(@"unwind Segue");
    
}



- (IBAction)travelBackButton:(UIButton *)sender {
    
    self.formatter.dateFormat =@"MMddyy";
    
    NSString *theDateString = self.destDateTextBox.text;
    
    NSDate *theDate = [self.formatter dateFromString:theDateString];
    
    self.formatter.dateFormat =@"MMM d, yyyy";
    
    self.presentDateLabel.text = [self.formatter stringFromDate:theDate];
    
    self.lastTimeDeptLabel.text = self.presentDateLabel.text;
    
}

- (IBAction)travelBackButtonTimerStarted:(UIButton *)sender {
    
    milesPerHour = 0;
    
    float speed = 0.08;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:speed target:self selector:@selector(updateMiles) userInfo:nil repeats:YES];
    
}

- (void)updateMiles {
    
    milesPerHour = milesPerHour + 1;
    
    if (milesPerHour == 88) {
        [self.timer invalidate];
        [self performSegueWithIdentifier:@"popupSegue" sender:nil];
    }
    
    self.counterLabel.text = [NSString stringWithFormat:@"%i", milesPerHour];
    
}

@end










