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
+ (UIColor*) colorForCategoria:(BeneficiosCategoriasEnum)categoria withAlpha:(CGFloat)alpha
{
    UIColor * color = [self colorForCategoria:categoria];
    
    return [color colorWithAlphaComponent:alpha];
//    color.
}
+ (UIColor*) colorForCategoria:(BeneficiosCategoriasEnum)categoria
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

+ (BeneficiosCategoriasEnum) categoriaByDescription:(NSString*) description
{
    for(BeneficiosCategoriasEnum cat=MenuOptionsCategorias_invalid+1;cat < MenuOptionsCategorias_count; cat++)
    {
       if([description isEqualToString:[CategoriasProvider descriptionForCategoria:cat]])
       {
           return cat;
       }
    }
    
    return MenuOptionsCategorias_invalid;
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


+ (UIImage*) pinForCategoria:(BeneficiosCategoriasEnum) categoria
{
    
    switch (categoria) {
        case MenuOptionsCategorias_Gastronomia:
            return [UIImage imageNamed:@"Gastronomia"];
            break;
            
        case MenuOptionsCategorias_Entretenimiento:
            return [UIImage imageNamed:@"Entretenimiento"];
            break;
            
        case MenuOptionsCategorias_Turismo:
            return [UIImage imageNamed:@"Turismo"];
            break;
            
        case MenuOptionsCategorias_CuidadoPersonal:
            return [UIImage imageNamed:@"Cuidado Personal"];
            break;
            
        case MenuOptionsCategorias_MasCategorias:
            return [UIImage imageNamed:@"Mas Categorias"];
            break;
            
        case MenuOptionsCategorias_Moda:
            return [UIImage imageNamed:@"Moda"];
            break;
            
        default:
            break;
    }
    
    return nil;
}
@end

