//
//  TodayViewController.m
//  Club La Nacion widget
//
//  Created by Sebastian Cancinos on 4/11/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface TodayViewController () <NCWidgetProviding, CLLocationManagerDelegate>

@property (nonatomic, strong) IBOutlet UICollectionView* listView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Set up location manager and start monitoring location
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestAlwaysAuthorization];
    }
    
    [self.locationManager startMonitoringSignificantLocationChanges];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

#pragma mark - CLLocationManagerDelegate

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
}
@end
