//
//  LNBenefit.h
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "IJAbstractDocument.h"
#import "LNBenefitData.h"
#import "LNBusiness.h"
#import <MapKit/MapKit.h>

@interface LNBenefit : IJAbstractDocument <MKAnnotation>
@property (nonatomic,strong)NSString *benefitId;
@property (nonatomic,strong)NSArray *benefitImages;
@property (nonatomic,strong)NSDate * benefitSinceDate;
@property (nonatomic,strong)NSDate * benefitToDate;

@property (nonatomic,strong)LNBenefitData *benefitData;
@property (nonatomic,strong)LNBusiness *benefitBusiness;
@property (nonatomic,strong)CLLocation *benefitLocation;

@property (nonatomic,readonly)CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

+(LNBenefit *)benefitWithDictionary:(NSDictionary *)benefitDictionary;

@end
