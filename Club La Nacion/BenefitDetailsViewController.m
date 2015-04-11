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

@interface BenefitDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *benefitCategoriesLabel;
@property (weak, nonatomic) IBOutlet UILabel *benefitDisscountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *benefitImageView;
@property (weak, nonatomic) IBOutlet UILabel *benefitExpirationDateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *benefitClassicCardImageView;
@property (weak, nonatomic) IBOutlet UIImageView *benefitPremiumCardImageView;
@property (weak, nonatomic) IBOutlet UILabel *benefitDescriptionLabel;
@property (weak, nonatomic) IBOutlet MKMapView *locationMapViewController;
@property (weak, nonatomic) IBOutlet UILabel *benefitBusinessAddressLabel;

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
    self.benefitCategoriesLabel.text = [NSString stringWithFormat:@"%@ - %@",self.benefit.benefitData.categoria,self.benefit.benefitData.subcategoria];
    self.benefitDisscountLabel.text = self.benefit.benefitData.tipo;
    [self.benefitImageView setImageWithURL:[NSURL URLWithString:[self.benefit.benefitImages firstObject]]];
    self.benefitExpirationDateLabel.text = [self.benefit.benefitToDate timeToExpireText];

    if (![self.benefit.benefitData.tarjeta containsString:@"classic"])
    {
        self.benefitClassicCardImageView.alpha = 0.15f;
    }
    if (![self.benefit.benefitData.tarjeta containsString:@"premium"])
    {
        self.benefitPremiumCardImageView.alpha = 0.15f;
    }
    
    self.benefitDescriptionLabel.text = self.benefit.benefitData.descripcion;
    self.locationMapViewController.centerCoordinate = CLLocationCoordinate2DMake(self.benefit.benefitLocation.coordinate.latitude, self.benefit.benefitLocation.coordinate.longitude);
    self.benefitBusinessAddressLabel.text = self.benefit.benefitBusiness.direccion;
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
