//
//  ViewController.m
//  09 CameraApp
//
//  Created by Joe Moss on 6/2/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) UIImagePickerController *pickerController;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) UIImage *currentImage;
@property (weak, nonatomic) IBOutlet UIButton *showDetailButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickerController = [[UIImagePickerController alloc] init];
    self.pickerController.delegate = self;
    
}
- (IBAction)cameraTapped:(UIBarButtonItem *)sender {
    
    NSLog(@"camera tapped");
    
    self.pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:self.pickerController animated:YES completion:nil];

}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self.pickerController dismissViewControllerAnimated:YES completion:nil];
    
    self.showDetailButton.enabled = NO;
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    self.currentImage = info[UIImagePickerControllerOriginalImage];
    
    self.imageView.image = self.currentImage;
    
    [self.pickerController dismissViewControllerAnimated:YES completion:nil];
    
    self.showDetailButton.enabled = YES;
    
}

- (IBAction)detailButtonTapped:(UIButton *)sender {
    
//    [self performSegueWithIdentifier:@"DetailSegue" sender:nil];
    
}


-(IBAction)unwindSegue: (UIStoryboardSegue *)segue {

    NSLog(@"Unwind Segue");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NextViewController * viewController = (NextViewController *) segue.destinationViewController;
    
    viewController.image = self.currentImage;
    
    

}

@end
