//
//  CategoriasProvider.h
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BeneficiosCategoriasEnum.h"

@interface CategoriasProvider : NSObject

+ (BeneficiosCategoriasEnum) categoriaByDescription:(NSString*) description;
+ (UIColor*) colorForCategoria:(BeneficiosCategoriasEnum) categoria;
+ (NSString*) descriptionForCategoria:(BeneficiosCategoriasEnum) categoria;
+ (UIImage*) pinForCategoria:(BeneficiosCategoriasEnum) categoria;

@end
