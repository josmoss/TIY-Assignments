//
//  PickerViewController.m
//  08 Jackpot
//
//  Created by Joe Moss on 6/1/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "PickerViewController.h"
#import "Ticket.h"

@interface PickerViewController () {
    
    NSArray *_pickerData;
}

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) Ticket *winningTicket;

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize Data
    _pickerData = @[@"Item1", @"Item2", @"Item3", @"Item4", @"Item5", @"Item6"];

}

@end
