//
//  LNBusiness.h
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNBusiness : NSObject

@property (nonatomic)NSInteger businessId;
@property (nonatomic,strong)NSString *sucursal;
@property (nonatomic,strong)NSString *nombre;
@property (nonatomic,strong)NSString *detalle;
@property (nonatomic,strong)NSString *descripcion;
@property (nonatomic,strong)NSString *direccion;

+(LNBusiness *)businessWithDictionary:(NSDictionary *)businessDictionary;

@end
