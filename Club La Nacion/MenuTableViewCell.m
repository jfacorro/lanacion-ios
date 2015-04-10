//
//  MenuTableViewCell.m
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "MenuTableViewCell.h"
#import "UIColor+RGB.h"

@implementation MenuTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setCategoria:(MenuOptionsCategoriasEnum)categoria
{
    _categoria = categoria;
    
    switch (categoria) {
        case MenuOptionsCategorias_Gastronomia:
            [self.menuLabel setText:@"Gastronomia"];
            [self setBackgroundColor:[UIColor colorWithRGB:@"#F39200"]];
            break;
            
        case MenuOptionsCategorias_Entretenimiento:
            [self.menuLabel setText:@"Entretenimiento"];
            [self setBackgroundColor:[UIColor colorWithRGB:@"#951B81"]];
            break;
            
        case MenuOptionsCategorias_Turismo:
            [self.menuLabel setText:@"Turismo"];
            [self setBackgroundColor:[UIColor colorWithRGB:@"#387738"]];
            break;
            
        case MenuOptionsCategorias_CuidadoPersonal:
            [self.menuLabel setText:@"Cuidado Personal"];
            [self setBackgroundColor:[UIColor colorWithRGB:@"#49BED6"]];
            break;
            
        case MenuOptionsCategorias_MasCategorias:
            [self.menuLabel setText:@"Mas Categorias"];
            [self setBackgroundColor:[UIColor colorWithRGB:@"#FC2C03"]];
            break;
            
        case MenuOptionsCategorias_Moda:
            [self.menuLabel setText:@"Moda"];
            [self setBackgroundColor:[UIColor colorWithRGB:@"#E72B71"]];
            break;

        case MenuOptionsCategorias_invalid:
            [self setBackgroundColor:[UIColor clearColor]];
            break;
            
        default:
            break;
    }
}
@end
