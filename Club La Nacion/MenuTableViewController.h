//
//  MenuTableViewController.h
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    MenuOptionsCategorias_invalid = -1,
    MenuOptionsCategorias_Gastronomia,
    MenuOptionsCategorias_Entretenimiento,
    MenuOptionsCategorias_Turismo,
    MenuOptionsCategorias_CuidadoPersonal,
    MenuOptionsCategorias_Moda,
    MenuOptionsCategorias_MasCategorias,
    MenuOptionsCategorias_count
}MenuOptionsCategoriasEnum;

@interface MenuTableViewController : UITableViewController

@end
