//
//  BeneficioCollectionViewCell.m
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "BeneficioCollectionViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
@interface BeneficioCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *benefitBusinessNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *benefitImageView;
@property (weak, nonatomic) IBOutlet UILabel *benefitDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *benefitDiscountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *benefitClassicCardImageView;
@property (weak, nonatomic) IBOutlet UIImageView *benefitPremiumCardImageView;

@end


@implementation BeneficioCollectionViewCell

-(void)setBeneficio:(LNBenefit *)beneficio
{
    _beneficio = beneficio;
    self.benefitDiscountLabel.text = self.beneficio.benefitData.tipo;
    if (![[self.beneficio.benefitData.tarjeta lowercaseString] containsString:@"classic"])
    {
        self.benefitClassicCardImageView.alpha = 0.15f;
    }else
    {
        self.benefitClassicCardImageView.alpha = 1.0f;
    }
        
    if (![[self.beneficio.benefitData.tarjeta lowercaseString] containsString:@"premium"])
    {
        self.benefitPremiumCardImageView.alpha = 0.15f;
    }else
    {
        self.benefitPremiumCardImageView.alpha = 1.0f;
    }
    self.benefitImageView.image = nil;
    [self.benefitImageView setImageWithURL:[NSURL URLWithString:[self.beneficio.benefitImages firstObject]]];
    self.benefitBusinessNameLabel.text = self.beneficio.benefitBusiness.nombre;
    self.benefitDescriptionLabel.text = self.beneficio.benefitData.descripcion;
}

@end
