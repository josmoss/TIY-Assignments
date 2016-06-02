//
//  TicketTableViewController.m
//  08 Jackpot
//
//  Created by Joe Moss on 6/1/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "TicketTableViewController.h"
#import "Ticket.h"
#import "PickerViewController.h"

@interface TicketTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *ticketsArray;
@property (nonatomic, strong) Ticket *winningTicket;
@property (nonatomic, strong) Ticket *randomTicket;

@end

@implementation TicketTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self chooseWinningTicket];
    
    self.ticketsArray = [[NSMutableArray alloc] init];
    
    NSLog(@"%@", [self generateRandomNumberString]);
    
    self.winningTicket =[self ticketWithRandomNumber];
    
    Ticket *randomT = [self ticketWithRandomNumber];
    
    if ([self.winningTicket.lottoTicketString isEqualToString:randomT.lottoTicketString]) {
        NSLog(@"equal");
    } else {
        NSLog(@"not equal");
    }
    
    NSLog(@"Winning Number is:%@",self.winningTicket.lottoTicketString);
    
}

-(Ticket *)ticketWithRandomNumber {
    
    Ticket *t = [[Ticket alloc] init];
    t.lottoTicketString = [self generateRandomNumberString];
    return t;
}

-(NSString *)generateRandomNumberString {
    
    int num1 = arc4random_uniform(53)+1;
    int num2 = arc4random_uniform(53)+1;
    int num3 = arc4random_uniform(53)+1;
    int num4 = arc4random_uniform(53)+1;
    int num5 = arc4random_uniform(53)+1;
    int num6 = arc4random_uniform(53)+1;

    return [NSString stringWithFormat:@"%i %i %i %i %i %i", num1, num2, num3, num4, num5, num6];
    
}

-(void)chooseWinningTicket {
    
    self.winningTicket = [[Ticket alloc] init];
    
    self.winningTicket.lottoTicketString =@"1 24 44 51 19 10";
    
}

#pragma mark - Table view delegate methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"the cell at %ld was tapped", indexPath.row);
    
}

#pragma mark - Table view data sourc

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.ticketsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TicketCell" forIndexPath:indexPath];
    
    Ticket *theTicket = [self.ticketsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = theTicket.lottoTicketString;
    
    return cell;
}

#pragma mark - Action Methods

- (IBAction)addTicket:(UIBarButtonItem *)sender {

    NSLog(@"addTicket");
    
    Ticket *ticket = [[Ticket alloc] init];
    
    ticket.lastName =@"Moss";
    ticket.firstName =@"Joe";
    ticket.lottoTicketString = [self generateRandomNumberString];
    
    [self.ticketsArray addObject:ticket];
    
    [self.tableView reloadData];

}

- (IBAction)unwindSegue:(UIStoryboardSegue *)segue {
    
    NSLog(@"unwindSegue");
    
}

- (IBAction)checkTicketTapped:(UIBarButtonItem *)sender {
    
    NSLog(@"check Ticket Tapped");
    
    [self performSegueWithIdentifier:@"PickerSegue" sender:self];
    
}

@end
