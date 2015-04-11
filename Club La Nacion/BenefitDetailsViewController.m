//
//  BenefitDetailsViewController.m
//  Club La Nacion
//
//  Created by Gera on 4/11/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "BenefitDetailsViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "NSDate+TimeAgo.h"
#import <MapKit/MapKit.h>
#import "CategoriasProvider.h"

@interface BenefitDetailsViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *benefitCategoriesLabel;
@property (weak, nonatomic) IBOutlet UILabel *benefitDisscountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *benefitImageView;
@property (weak, nonatomic) IBOutlet UILabel *benefitExpirationDateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *benefitClassicCardImageView;
@property (weak, nonatomic) IBOutlet UIImageView *benefitPremiumCardImageView;
@property (weak, nonatomic) IBOutlet UILabel *benefitDescriptionLabel;
@property (weak, nonatomic) IBOutlet MKMapView *locationMapViewController;
@property (weak, nonatomic) IBOutlet UILabel *benefitBusinessAddressLabel;
@property (weak, nonatomic) IBOutlet UIImageView *benefitMapMarker;


@end

@implementation BenefitDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setOutletsValues];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setOutletsValues
{
    [self setTitle:self.benefit.benefitData.nombre];
    
    self.benefitCategoriesLabel.text = self.benefit.benefitData.subcategoria;
    self.benefitCategoriesLabel.textColor = [CategoriasProvider colorForCategoria:[CategoriasProvider categoriaByDescription:self.benefit.benefitData.categoria] withAlpha:0.75];
    
    self.benefitDisscountLabel.text = self.benefit.benefitData.tipo;
    [self.benefitImageView setImageWithURL:[NSURL URLWithString:[self.benefit.benefitImages firstObject]]];
    if([self.benefit.benefitToDate secondsToExpire] > 0)
    {
        self.benefitExpirationDateLabel.text = [NSString stringWithFormat:@"Termina en %@",[self.benefit.benefitToDate timeToExpireText]];
    }
    else
        self.benefitExpirationDateLabel.text = @"Finalizado";
     
    
    if (![self.benefit.benefitData.tarjeta containsString:@"classic"])
    {
        self.benefitClassicCardImageView.alpha = 0.15f;
    }
    if (![[self.benefit.benefitData.tarjeta lowercaseString] containsString:@"premium"])
    {
        self.benefitPremiumCardImageView.alpha = 0.15f;
    }
    
    self.locationMapViewController.delegate = self;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(self.benefit.benefitLocation.coordinate.latitude, self.benefit.benefitLocation.coordinate.longitude), 500, 500);
    MKCoordinateRegion adjustedRegion = [self.locationMapViewController regionThatFits:viewRegion];
    [self.locationMapViewController setRegion:adjustedRegion animated:YES];
    self.locationMapViewController.showsUserLocation = NO;

    self.benefitDescriptionLabel.text = self.benefit.benefitData.descripcion;
    [self.locationMapViewController addAnnotation:self.benefit];
    self.benefitBusinessAddressLabel.text = self.benefit.benefitBusiness.direccion;
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
    MKAnnotationView* pinView = [[MKAnnotationView alloc]
                                 initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
    pinView.canShowCallout=YES;
    
    self.benefitMapMarker.image =[CategoriasProvider pinForCategoria:[CategoriasProvider categoriaByDescription:((LNBenefit*)annotation).benefitData.categoria]];
    
    pinView.image =self.benefitMapMarker.image;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
