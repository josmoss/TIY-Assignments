//
//  MovieTableViewController.m
//  09 JSON
//
//  Created by Joe Moss on 6/3/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "MovieTableViewController.h"
#import "Movie.h"
#import "ProfileViewController.h"

@interface MovieTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *movieListTableView;
@property (nonatomic, strong) NSMutableArray *moviesArray;
@property (nonatomic, strong) Movie *listMovies;
@property (nonatomic, strong) UIImage *theImage;

@end

@implementation MovieTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.moviesArray = [[NSMutableArray alloc] init];
    
    [self loadJSONFile];
    
}

#pragma mark - JSON data

-(void)loadJSONFile {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"popular"
                                                         ofType:@"json"];
    
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath
                                                           encoding:NSUTF8StringEncoding error:NULL];
    //NSLog(@"%@", jsonString);
    
    NSError *error = nil;
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&error];
    
    if(error == nil) {
        
        NSArray *resultsArray = [jsonDictionary objectForKey:@"results"];
        
        for(NSDictionary *dict in resultsArray) {
            
            NSLog(@"dict == %@", dict);
            
            Movie *m = [[Movie alloc] init];
            
            NSString *title = [dict objectForKey:@"original_title"];
            
            if (title != nil) {
                m.originalTitle = title;
            } else {
                m.originalTitle =@"";
                NSLog(@"Could not parse title field");
            }
            
            NSString *posterPath = [dict objectForKey:@"poster_path"];
            
            if (posterPath != nil) {
                m.posterPath = posterPath;
            } else {
                m.posterPath =@"";
                NSLog(@"Could not parse powers field");
            }
            
            if (m != nil) {
                [self.moviesArray addObject:m];
            }
            
            NSLog(@"Movie Count: %ld", self.moviesArray.count);
        }
        
    } else {
        NSLog(@"Could not parse json into NSDictionary");
    }
    
    UIImage *myImage = [self imageFromURLString:@"http://image.tmdb.org/t/p/w500/jjBgi2r5cRt36xF6iNUEhzscEcb.jpg"];
    
    if (myImage == nil) {
        NSLog(@"Could not load the iamge");
    } else {
        NSLog(@"Got the image!");
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


#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.moviesArray count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    
    self.listMovies = [self.moviesArray objectAtIndex:indexPath.row];
    self.theImage = [self imageFromURLString:self.listMovies.posterPath];
    
    cell.textLabel.text = self.listMovies.originalTitle;
    
    cell.imageView.image = self.theImage;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.listMovies = [self.moviesArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"MovieDetailSegue" sender:nil];
    
}

#pragma mark - Navigation Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"MovieDetailSegue"]) {
        
        ProfileViewController *controller = (ProfileViewController *)segue.destinationViewController;
        
        controller.theMovie = self.listMovies;
    }
    
}

@end
