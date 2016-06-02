//
//  PickerViewController.h
//  08 Jackpot
//
//  Created by Joe Moss on 6/1/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"

@interface PickerViewController : UIViewController
@property (strong, nonatomic) Ticket *theWinningTicket;

@end
