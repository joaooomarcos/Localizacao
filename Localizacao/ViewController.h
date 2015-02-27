//
//  ViewController.h
//  Localizacao
//
//  Created by João Marcos on 26/02/15.
//  Copyright (c) 2015 João Marcos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (retain) CLLocationManager *locationManager;

@property NSArray *locat;

- (IBAction)atualizar:(id)sender;
- (IBAction)pin:(id)sender;

@end

