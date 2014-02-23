//
//  ViewController.m
//  MakerSpace Checkin
//
//  Created by SouthWolf on 2/23/14.
//  Copyright (c) 2014 Microduino. All rights reserved.
//

#import "ViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    // Microduino iBeacons UUID
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"D290BB5C-A175-4AF7-AFE5-84921E0D6979"];
    
    self.myBeaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"cc.microduino.myRegion"];
    self.myBeaconRegion.notifyOnEntry = YES;
    self.myBeaconRegion.notifyEntryStateOnDisplay = YES;
    
    [self.locationManager startMonitoringForRegion:self.myBeaconRegion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    [self.locationManager startRangingBeaconsInRegion:self.myBeaconRegion];
    NSLog(@"Enter");
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    self.statusLabel.text = @"Welcome to\nMicroduino\nStudio!";
    AVObject *userCheckinEvent = [AVObject objectWithClassName:@"UserCheckinEvent"];
    [userCheckinEvent setObject:[NSNumber numberWithInt:1] forKey:@"userId"];
    [userCheckinEvent setObject:@"SouthWolf" forKey:@"userName"];
    [userCheckinEvent setObject:[NSNumber numberWithInt:1] forKey:@"eventId"];
    [userCheckinEvent setObject:@"Maker Meetup" forKey:@"eventName"];
    [userCheckinEvent setObject:[NSDate date] forKey:@"eventDate"];
    [userCheckinEvent save];
}

@end
