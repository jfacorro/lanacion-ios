//
//  BeneficiosMapViewController.m
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "BeneficiosMapViewController.h"
#import "CategoriasProvider.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "LNClubBackend.h"
#import "LNBenefitRepository.h"
#import "LNBenefit.h"

@interface BeneficiosMapViewController () <MKMapViewDelegate>

@property (nonatomic,strong) LNClubBackend *backend;
@property (nonatomic,strong) LNBenefitRepository *repository;
@property (nonatomic,strong) NSArray *benefitsArray;
@property (nonatomic, strong) CLLocationManager* locationManager;


@property (nonatomic, strong) IBOutlet MKMapView* mapView;
@end

@implementation BeneficiosMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    [self.locationManager setDistanceFilter:500.f];
    [self.locationManager startUpdatingLocation];
    [self.locationManager startMonitoringSignificantLocationChanges];
    
    self.backend = [[LNClubBackend alloc]init];
    self.repository = [[LNBenefitRepository alloc]initWithBackend:self.backend];
    self.repository.serverUrl = @"http://lanacion.herokuapp.com/api";
    
    [self.mapView setDelegate:self];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadBeneficiosByLocation:(CLLocationCoordinate2D) coordinate
{
    self.repository.basePath = [NSString stringWithFormat:@"geo/%f/%f/200",coordinate.latitude,coordinate.longitude];
    
    [self.repository findAllDocumentsWithSuccess:^(NSArray *documents) {
        self.benefitsArray = [NSArray arrayWithArray:documents];
        [self updateMapWithBeneficios];
    } failure:^(IJError *error) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Ocurrio un error. Intente de nuevo" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil];
        [alert show];
        NSLog(@"failure");
    }];

}

- (void) updateMapWithBeneficios
{
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotations:self.benefitsArray];
}

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation* lastLocation = [locations lastObject];
    [self loadBeneficiosByLocation:lastLocation.coordinate];
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    [self loadBeneficiosByLocation:self.mapView.centerCoordinate];

}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    [self loadBeneficiosByLocation:self.mapView.centerCoordinate];

}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
    MKAnnotationView* pinView = [[MKAnnotationView alloc]
                                    initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
    pinView.canShowCallout=YES;
    pinView.image = [CategoriasProvider pinForCategoria:[CategoriasProvider categoriaByDescription:((LNBenefit*)annotation).benefitData.categoria]];
    pinView.enabled = YES;
    pinView.canShowCallout = YES;
    
    UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [rightButton setTitle:annotation.title forState:UIControlStateNormal];
    [rightButton addTarget:self
                    action:@selector(showDetails)
          forControlEvents:UIControlEventTouchUpInside];
    
    pinView.rightCalloutAccessoryView = rightButton;
    
//    UIImageView *profileIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rest_image2.png"]];
//    pinView.leftCalloutAccessoryView = profileIconView;
    
    return pinView;
}

- (void) showDetails
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
