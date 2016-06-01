//
//  ViewController.m
//  07 Star Wars
//
//  Created by Joe Moss on 5/31/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

#import "ViewController.h"
#import "StarWarsCharacter.h"
#import "ProfileViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *charactersArray;
@property (strong, nonatomic) StarWarsCharacter *currentCharacter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.charactersArray = [[NSMutableArray alloc] init];
    
    StarWarsCharacter *luke = [[StarWarsCharacter alloc] initWithName:@"Luke Skywalker" spaceShip:@"X-Wing"];
    [self.charactersArray addObject:luke];
    
    StarWarsCharacter *han = [[StarWarsCharacter alloc] init];
    han.name =@"Han Solo";
    han.spaceship =@"Millenium Falcon";
    
    [self.charactersArray addObject:han];
    
    StarWarsCharacter *darth = [[StarWarsCharacter alloc] init];
    darth.name =@"Darth Vader";
    darth.spaceship =@"Tie Fighter";
    
    [self.charactersArray addObject:darth];
    
    StarWarsCharacter *yoda = [[StarWarsCharacter alloc] init];
    yoda.name =@"Master Yoda";
    yoda.spaceship =@"Yoda Ship";
    
    [self.charactersArray addObject:yoda];
    
    StarWarsCharacter *chewy = [[StarWarsCharacter alloc] init];
    chewy.name =@"Chewbacca";
    chewy.spaceship =@"Millenium Falcon";
    
    [self.charactersArray addObject:chewy];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.charactersArray count];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    self.currentCharacter = [self.charactersArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = self.currentCharacter.name;
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"I clicked on row %ld", indexPath.row);
    
    self.currentCharacter = [self.charactersArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"ProfileSegue" sender:nil];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
    if ([segue.identifier isEqualToString:@"ProfileSegue"]) {
    
        ProfileViewController *profileController = (ProfileViewController *)segue.destinationViewController;
        
        profileController.theCharacter = self.currentCharacter;
        
    }
}
    
@end
