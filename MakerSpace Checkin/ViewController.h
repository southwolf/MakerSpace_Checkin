//
//  ViewController.h
//  MakerSpace Checkin
//
//  Created by SouthWolf on 2/23/14.
//  Copyright (c) 2014 Microduino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>

@property (strong, nonatomic) CLBeaconRegion *myBeaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;


@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end
