//
//  spotificationTableViewController.m
//  12 SpotifyAPI
//
//  Created by Joe Moss on 6/7/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "spotificationTableViewController.h"
#import "Album.h"

@interface spotificationTableViewController ()
@property (nonatomic, strong) NSMutableArray *albumsArray;
@property (nonatomic, strong) Album *albumAttributes;

@end

@implementation spotificationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self parseJSON];
    
}

#pragma mark - JSON

-(void)parseJSON {
    
    self.albumsArray = [[NSMutableArray alloc] init];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"boh" ofType:@"json"];
    
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    //    NSLog(@"jsonString == %@", jsonString);
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    if (data != nil) {
        
        NSError *jsonError = nil;
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                       options:NSJSONReadingAllowFragments
                                                                         error:&jsonError];
        
        if (jsonError == nil) {
            
            //            NSLog(@"jsonDictionary == %@", jsonDictionary);
            
            NSArray *itemsArray = [jsonDictionary valueForKey:@"items"];
            //            NSLog(@"itemsArray == %@", itemsArray);
            
            for(NSDictionary *itemDict in itemsArray) {
                
                Album *theAlbum = [[Album alloc] initWithDictionary:itemDict];
                [self.albumsArray addObject:theAlbum];
                
            }
            
            //            NSLog(@"The number of albums parsed is %ld", self.albumsArray.count);
        } else {
            //            NSLog(@"An error occured == %@", [jsonError localizedDescription]);
        }
    } else {
        NSLog(@"I was not able to create the NSData");
    }
    
}

#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.albumsArray count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpotCell" forIndexPath:indexPath];
    
    self.albumAttributes = [self.albumsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = self.albumAttributes.name;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.albumAttributes = [self.albumsArray objectAtIndex:indexPath.row];
    
}

@end
