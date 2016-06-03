//
//  nextViewController.m
//  09 CameraApp
//
//  Created by Joe Moss on 6/3/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "nextViewController.h"

@interface NextViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *passedImageVC;


@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void) viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    self.passedImageVC.image = self.image;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
