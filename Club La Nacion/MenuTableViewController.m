//
//  MenuTableViewController.m
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "MenuTableViewController.h"
#import "MenuTableViewCell.h"

typedef enum
{
    MenuOptionsSections_Mapa,    
    MenuOptionsSections_Categorias,
    MenuOptionsSections_Config,
    MenuOptionsSections_count
}MenuOptionsSections;
@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return MenuOptionsSections_count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    NSInteger rows = 1;
    
    switch (section) {
        case MenuOptionsSections_Categorias:
            rows = MenuOptionsCategorias_count;
            break;
            
        default:
            rows = 1;
            break;
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCellID" forIndexPath:indexPath];
    
    // Configure the cell...
    
    switch (indexPath.section) {
        case MenuOptionsSections_Categorias:
            [cell setCategoria:(BeneficiosCategoriasEnum)indexPath.row];
            break;
            
        case MenuOptionsSections_Config:
            [cell setCategoria:MenuOptionsCategorias_invalid];
            [cell.menuLabel setText:@"Configuracion"];
            cell.menuLabel.textColor = [UIColor colorWithRed:130.0/255.0 green:130.0/255.0 blue:130.0/255.0 alpha:1.0];
            break;
            
        case MenuOptionsSections_Mapa:
            [cell setCategoria:MenuOptionsCategorias_invalid];
            cell.menuImageView.image = [UIImage imageNamed:@"Mas Categorias"];
            cell.menuLabel.textColor = [UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
            [cell.menuLabel setText:@"Cerca tuyo"];
            break;
            
        default:
            break;
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case MenuOptionsSections_Categorias:
            [self.delegate showBeneficios:(BeneficiosCategoriasEnum)indexPath.row];
            break;
            
        case MenuOptionsSections_Config:
            [self.delegate showConfiguracion];
            break;
            
        case MenuOptionsSections_Mapa:
            [self.delegate showMapa];
            break;
            
        default:
            break;
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
