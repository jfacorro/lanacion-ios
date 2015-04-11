//
//  BeneficiosManager.h
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/11/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LNBenefit.h"
#import "BeneficiosCategoriasEnum.h"

@class BeneficiosManager;
@protocol BeneficiosManagerDelegate <NSObject>

- (void) BeneficiosManager: (BeneficiosManager*) manager updatedBeneficios:(NSArray*) beneficios;

@end

@interface BeneficiosManager : NSObject

@property (nonatomic,strong) NSArray *benefitsArray;
@property (nonatomic, weak) id<BeneficiosManagerDelegate> delegate;

- (void)loadNearBeneficiosByLocation:(CLLocationCoordinate2D) coordinate;
- (void)loadBeneficiosByLocation:(CLLocationCoordinate2D) coordinate;
- (void)loadBeneficiosByCategoria:(BeneficiosCategoriasEnum) categoria;


@end
