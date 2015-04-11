//
//  MapBenefitDetailView.h
//  Club La Nacion
//
//  Created by Gera on 4/11/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "LNBenefit.h"

@protocol MapDetailDelegate
-(void)showBenefitDetails:(LNBenefit *)benefit;
@end

@interface MapBenefitDetailView : UIView

@property (weak, nonatomic) id <MapDetailDelegate> delegate;

@property (nonatomic,strong)LNBenefit *benefit;

+ (instancetype)view;
@end
