//
//  PickerViewController.m
//  08 Jackpot
//
//  Created by Joe Moss on 6/1/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "PickerViewController.h"
#import "Ticket.h"

@interface PickerViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) NSMutableArray *numbersArray;

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");

    self.numbersArray = [[NSMutableArray alloc] init];

    for(int i=0; i <= 53; i++) {
        [self.numbersArray addObject:[NSString stringWithFormat:@"%i",i]];
    }

}

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear");
    
    NSLog(@"PickerViewController winning ticket %@", self.theWinningTicket.lottoTicketString);
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSLog(@"I changed something");
    
    NSLog(@"I selected %ld in component %ld", row, component);
    
}

    // The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 6;
}

    // The number of rows of data
- (NSInteger)PickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.numbersArray.count;
    
}

    // The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [self.numbersArray objectAtIndex:row];
    
}

@end
