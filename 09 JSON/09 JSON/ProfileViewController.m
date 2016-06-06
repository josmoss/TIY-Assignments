//
//  ProfileViewController.m
//  09 JSON
//
//  Created by Joe Moss on 6/3/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.theMovie != nil) {
        
        self.movieTitleLabel.text = self.theMovie.originalTitle;
        
        // 1. Load the image from the urlString
        UIImage *theImage = [self imageFromURLString:self.theMovie.posterPath];
        
        self.posterImageView.image = theImage;
        
        NSLog(@"title: %@", self.theMovie.originalTitle);
        NSLog(@"posterPath: %@", self.theMovie.posterPath);
    }
    
}
    
-(UIImage *)imageFromURLString:(NSString *)urlString {
    
    UIImage *theImage = nil;
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSLog(@"Attempting to Load urlString == %@", urlString);
    
    //
    if(url != nil) {
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        if(data != nil) {
            theImage = [UIImage imageWithData:data];
        }
    }
    return theImage;
}

@end
