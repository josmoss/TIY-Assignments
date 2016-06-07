//
//  IndyTableViewController.m
//  10 Raiders Lost App
//
//  Created by Joe Moss on 6/6/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "IndyTableViewController.h"
#import "IndyCharacter.h"

@interface IndyTableViewController ()
@property (nonatomic, strong) NSMutableArray *jonesArray;
@property (nonatomic, strong) IndyCharacter *indyAttributes;
@property (strong, nonatomic) IBOutlet UITableView *indyCharTableView;

@end

@implementation IndyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self parseJSON];
    
}

-(void)parseJSON {
    
    self.jonesArray = [[NSMutableArray alloc] init];
    
    NSString *jsonString = [self stringFromJSONFile];
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingAllowFragments error:NULL];
    
//    NSLog(@"jsonDictionary == %@", jsonDictionary);
    
    NSArray *jsonArray = [jsonDictionary objectForKey:@"results"];
    
    for(NSDictionary *dict in jsonArray) {
        IndyCharacter *theChar = [[IndyCharacter alloc] initWithDictionary:dict];
        [self.jonesArray addObject:theChar];
        
    }
    NSLog(@"count of characters == %ld", self.jonesArray.count);
    
}

#pragma mark - Helper Methods

-(NSString *)stringFromJSONFile {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"indyposts" ofType:@"json"];
    
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath
                                                           encoding:NSUTF8StringEncoding
                                                              error:NULL];
    //NSLog(@"%@", jsonString);
    return jsonString;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.jonesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IndyCell" forIndexPath:indexPath];
    
    self.indyAttributes = [self.jonesArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = self.indyAttributes.charName;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.indyAttributes = [self.jonesArray objectAtIndex:indexPath.row];
    
}

@end
