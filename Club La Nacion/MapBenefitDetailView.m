//
//  MapBenefitDetailView.m
//  Club La Nacion
//
//  Created by Gera on 4/11/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "MapBenefitDetailView.h"
#import "CategoriasProvider.h"
#import "NSDate+TimeAgo.h"

@interface MapBenefitDetailView ()
@property (weak, nonatomic) IBOutlet UIImageView *benefitImageView;
@property (weak, nonatomic) IBOutlet UIImageView *benefitClassicCardImageView;
@property (weak, nonatomic) IBOutlet UIImageView *benefitPremiumCardImageView;
@property (weak, nonatomic) IBOutlet UILabel *benefitCategoryAndNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *benefitMapPinImageView;
@property (weak, nonatomic) IBOutlet UILabel *benefitBusinessAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *benefitExpirationDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *benefitBusinesNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *benefitDisscountLabel;

@end

@implementation MapBenefitDetailView

+ (instancetype)view
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MapBenefitDetailView" owner:nil options:nil] firstObject];
}

- (void)setBenefit:(LNBenefit *)benefit
{
    _benefit = benefit;
    self.benefitDisscountLabel.text = self.benefit.benefitData.tipo;
    self.benefitCategoryAndNameLabel.text = [NSString stringWithFormat:@"%@ - %@",self.benefit.benefitData.categoria, self.benefit.benefitData.nombre];
    
    self.benefitMapPinImageView.image =[CategoriasProvider pinForCategoria:[CategoriasProvider categoriaByDescription:self.benefit.benefitData.categoria]];
    self.benefitBusinessAddressLabel.text = self.benefit.benefitBusiness.direccion;
    self.benefitBusinesNameLabel.text = self.benefit.benefitBusiness.nombre;
    self.benefitExpirationDateLabel.text = [self.benefit.benefitToDate timeToExpireText];
    
    if (![[self.benefit.benefitData.tarjeta lowercaseString] containsString:@"classic"])
    {
        self.benefitClassicCardImageView.alpha = 0.35f;
    }
    if (![[self.benefit.benefitData.tarjeta lowercaseString] containsString:@"premium"])
    {
        self.benefitPremiumCardImageView.alpha = 0.35f;
    }
    
}
- (IBAction)hideView:(id)sender {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];

    CGRect viewFrame = self.frame;
    viewFrame.origin.y += viewFrame.size.height + 1;
    self.frame = viewFrame;
    
    [UIView commitAnimations];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
