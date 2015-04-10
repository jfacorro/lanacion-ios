//
//  LNBenefitData.h
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNBenefitData : NSObject

@property (nonatomic)NSInteger benefitDataId;
@property (nonatomic,strong)NSString *nombre;
@property (nonatomic,strong)NSString *categoria;
@property (nonatomic,strong)NSString *subcategoria;
@property (nonatomic,strong)NSString *descripcion;
@property (nonatomic,strong)NSString *tipo;
@property (nonatomic,strong)NSString *tarjeta;

+(LNBenefitData *)benefitDataWithDictionary:(NSDictionary *)benefitDataDictionary;

@end
