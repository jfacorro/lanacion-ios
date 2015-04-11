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
#import "MapBenefitDetailView.h"

@interface BeneficiosMapViewController () <MKMapViewDelegate>

@property (nonatomic,strong) LNClubBackend *backend;
@property (nonatomic,strong) LNBenefitRepository *repository;
@property (nonatomic,strong) NSArray *benefitsArray;
@property (nonatomic, strong) CLLocationManager* locationManager;

@property (nonatomic,strong) MapBenefitDetailView *mapDetailView;

@property (nonatomic, strong) IBOutlet MKMapView* mapView;
@end

@implementation BeneficiosMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createMapDetailView];
    
    self.title = @"Cerca tuyo";
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager setDelegate:self];
    [self.locationManager setDistanceFilter:500.f];
    [self.locationManager startUpdatingLocation];
    [self.locationManager startMonitoringSignificantLocationChanges];
    
    self.backend = [[LNClubBackend alloc]init];
    self.repository = [[LNBenefitRepository alloc]initWithBackend:self.backend];
    self.repository.serverUrl = @"http://lanacion.herokuapp.com/api";
//    self.repository.serverUrl = @"http://23.23.128.233:8080/api";
    
    [self.mapView setDelegate:self];
    
    self.mapView.showsUserLocation = YES;

    // Do any additional setup after loading the view.
}
- (void)createMapDetailView
{
    self.mapDetailView = [MapBenefitDetailView view];
    CGRect detailFrame = self.mapDetailView.frame;
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    detailFrame.origin.y = screenHeight + 1;
    self.mapDetailView.frame = detailFrame;
    [self.view addSubview:self.mapDetailView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadBeneficiosByLocation:(CLLocationCoordinate2D) coordinate
{
    self.repository.basePath = [NSString stringWithFormat:@"geo/%f/%f/1000",coordinate.latitude,coordinate.longitude];
    
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
    [self.mapView addAnnotations:self.benefitsArray];
}

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation* lastLocation = [locations lastObject];
    [self loadBeneficiosByLocation:lastLocation.coordinate];
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(lastLocation.coordinate, 500, 500);
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
    [self.mapView setRegion:adjustedRegion animated:YES];
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

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    for (id currentAnnotation in self.mapView.annotations) {
            [self.mapView deselectAnnotation:currentAnnotation animated:YES];
    }
    self.mapDetailView.benefit = (LNBenefit *)view.annotation;

    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    CGRect mapDetailViewFrame = self.mapDetailView.frame;
    
    if ( mapDetailViewFrame.origin.y >= screenHeight)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        mapDetailViewFrame.origin.y = screenHeight - mapDetailViewFrame.size.height;
        self.mapDetailView.frame = mapDetailViewFrame;
    }
    [UIView commitAnimations];
}
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
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
