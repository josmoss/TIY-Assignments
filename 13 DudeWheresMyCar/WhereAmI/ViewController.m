//
//  ViewController.m
//  WhereAmI
//
//  Created by Joe Moss on 6/8/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

@import MapKit;
@import CoreLocation;

#import "ViewController.h"

@interface ViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startUpdatingLocation];
    
}

#pragma mark - Map Kit and Core Location

-(void)startUpdatingLocation {
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.delegate = self;
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    //    [self.locationManager startUpdatingLocation];
    
    //    [self.locationManager startMonitoringSignificantLocationChanges];
    [self.locationManager requestWhenInUseAuthorization];

    
}
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    NSLog(@"Authorization changed");
    
    if (status != kCLAuthorizationStatusDenied) {
        [self.locationManager requestLocation];
    }
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    NSLog(@"didFail");
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    NSLog(@"didUpdate");
    
    CLLocation *location = [locations firstObject];
    CLLocationCoordinate2D coord = location.coordinate;
    
    NSLog(@"latitude == %2.8f, longitude == %2.8f", coord.latitude, coord.longitude);
    
}
    
-(void)centerMapWithCoordinate:(CLLocationCoordinate2D)center {
    
    MKCoordinateRegion region = MKCoordinateRegionMake(coord, MKCoordinateSpanMake(0.60, 0.60));
    
    [self.mapView setRegion:region animated:YES];
    [self.mapView setShowsUserLocation:YES];
    
    [self centerMapWithCoordinate:coord];

}

#pragma mark - action buttons
    
}
- (IBAction)locationButton:(UIBarButtonItem *)sender {
    
    NSLog(@"I clicked the button");
    [self.locationManager requestLocation];
}
- (IBAction)satButton:(UIBarButtonItem *)sender {
    
    [_mapView setMapType:MKMapTypeSatellite];
    
}

- (IBAction)mapButton:(UIBarButtonItem *)sender {
    
    [_mapView setMapType:MKMapTypeStandard];
    
}

- (IBAction)hybridButton:(UIBarButtonItem *)sender {
    
    [_mapView setMapType:MKMapTypeHybrid];
    
}

@end
