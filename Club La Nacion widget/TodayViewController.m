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
#import "BeneficiosManager.h"
#import "TodayCollectionViewCell.h"

@interface TodayViewController () <NCWidgetProviding, CLLocationManagerDelegate,BeneficiosManagerDelegate>

@property (nonatomic, strong) IBOutlet UICollectionView* collectionView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic, strong) BeneficiosManager *beneficiosManager;
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
    CLLocation* lastLocation = [locations lastObject];
    [self.beneficiosManager loadBeneficiosByLocation:lastLocation.coordinate];

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionView.frame.size.width, 220.0f);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.beneficiosManager.benefitsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TodayCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TodayViewCell" forIndexPath:indexPath];
    
    [cell setBeneficio:[self.beneficiosManager.benefitsArray objectAtIndex:indexPath.row]];
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    BenefitDetailsViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"BenefitDetailsViewController"];
//    
//    [controller setBenefit:[self.beneficiosManager.benefitsArray objectAtIndex:indexPath.row]];
//    
//    [self.navigationController pushViewController:controller animated:YES];

}

- (void) BeneficiosManager:(BeneficiosManager *)manager updatedBeneficios:(NSArray *)beneficios
{
    [self.collectionView reloadData];
}

@end
