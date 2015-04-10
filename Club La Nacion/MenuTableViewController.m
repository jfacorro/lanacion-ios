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
    MenuOptionsSections_Categorias,
    MenuOptionsSections_Config,
    MenuOptionsSections_Mapa,
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
            [cell setCategoria:(MenuOptionsCategoriasEnum)indexPath.row];
            break;
            
        case MenuOptionsSections_Config:
            [cell setCategoria:MenuOptionsCategorias_invalid];
            [cell.menuLabel setText:@"Configuracion"];
            break;
            
        case MenuOptionsSections_Mapa:
            [cell setCategoria:MenuOptionsCategorias_invalid];
            [cell.menuLabel setText:@"Mapa"];
            break;
            
        default:
            break;
    }
    return cell;
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
