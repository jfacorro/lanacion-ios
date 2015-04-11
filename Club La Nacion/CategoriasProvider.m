//
//  CategoriasProvider.m
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "CategoriasProvider.h"
#import "UIColor+RGB.h"

@implementation CategoriasProvider

+ (UIColor*) colorForCategoria:(BeneficiosCategoriasEnum) categoria
{
    switch (categoria) {
        case MenuOptionsCategorias_Gastronomia:
            return [UIColor colorWithRGB:@"#F39200"];
            break;
            
        case MenuOptionsCategorias_Entretenimiento:
            return [UIColor colorWithRGB:@"#951B81"];
            break;
            
        case MenuOptionsCategorias_Turismo:
            return [UIColor colorWithRGB:@"#387738"];
            break;
            
        case MenuOptionsCategorias_CuidadoPersonal:
            return [UIColor colorWithRGB:@"#49BED6"];
            break;
            
        case MenuOptionsCategorias_MasCategorias:
            return [UIColor colorWithRGB:@"#FC2C03"];
            break;
            
        case MenuOptionsCategorias_Moda:
            return [UIColor colorWithRGB:@"#E72B71"];
            break;
            
        default:
            break;
    }
    
    return [UIColor clearColor];
}

+ (NSString*) descriptionForCategoria:(BeneficiosCategoriasEnum) categoria
{
    
    switch (categoria) {
        case MenuOptionsCategorias_Gastronomia:
            return @"Gastronomía";
            break;
            
        case MenuOptionsCategorias_Entretenimiento:
            return @"Entretenimiento";
            break;
            
        case MenuOptionsCategorias_Turismo:
            return @"Turismo";
            break;
            
        case MenuOptionsCategorias_CuidadoPersonal:
            return @"Cuidado Personal";
            break;
            
        case MenuOptionsCategorias_MasCategorias:
            return @"Más Categorías";
            break;
            
        case MenuOptionsCategorias_Moda:
            return @"Moda";
            break;
            
        default:
            break;
    }
   
    return @"";
}

@end
