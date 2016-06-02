//
//  TicketTableViewController.m
//  08 Jackpot
//
//  Created by Joe Moss on 6/1/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "TicketTableViewController.h"
#import "Ticket.h"

@interface TicketTableViewController ()

@property (nonatomic, strong) NSMutableArray *ticketsArray;
@property (nonatomic, strong) Ticket *winningTicket;

@end

@implementation TicketTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self chooseWinningTicket];
    
    self.ticketsArray = [[NSMutableArray alloc] init];
    
}

-(void)chooseWinningTicket {
    
    self.winningTicket = [[Ticket alloc] init];
    
    self.winningTicket.lotteryTicket =@" ";
    
}

#pragma mark - Table view delegate methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"the cell at %ld was tapped", indexPath.row);
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.ticketsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TicketCell" forIndexPath:indexPath];
    
    Ticket *theTicket = [self.ticketsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = theTicket.lotteryTicket;
    
    return cell;
}

#pragma mark - Action Methods

- (IBAction)addTicket:(UIBarButtonItem *)sender {

    NSLog(@"addTicket");
    
    Ticket *ticket = [[Ticket alloc] init];
    
    ticket.lastName =@"Moss";
    ticket.firstName =@"Joe";
    ticket.lotteryTicket =@"3 16 24 11 6 50";
    
    [self.ticketsArray addObject:ticket];
    
    [self.tableView reloadData];

}





@end
