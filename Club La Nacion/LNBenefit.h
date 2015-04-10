//
//  LNBenefit.h
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@class LNBenefitData,LNBusiness;

@interface LNBenefit : NSObject
@property (nonatomic,strong)NSString *benefitId;
@property (nonatomic,strong)CLLocation *benefitLocation;
@property (nonatomic,strong)LNBenefitData *benefitData;
@property (nonatomic,strong)LNBusiness *benefitBusiness;
@property (nonatomic,strong)NSString *benefitImageString;
@property (nonatomic,strong)NSDate * benefitSinceDate;
@property (nonatomic,strong)NSDate * benefitToDate;

+(LNBenefit *)benefitWithDictionary:(NSDictionary *)benefitDictionary;

@end
