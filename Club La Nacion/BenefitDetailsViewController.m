//
//  BenefitDetailsViewController.m
//  Club La Nacion
//
//  Created by Gera on 4/11/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "BenefitDetailsViewController.h"

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
