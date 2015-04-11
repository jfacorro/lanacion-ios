//
//  MenuTableViewCell.m
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "MenuTableViewCell.h"
#import "CategoriasProvider.h"

@implementation MenuTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setCategoria:(BeneficiosCategoriasEnum)categoria
{
    _categoria = categoria;
    
    [self.menuLabel setText:[CategoriasProvider descriptionForCategoria:categoria]];
    [self setBackgroundColor:[CategoriasProvider colorForCategoria:categoria withAlpha:0.75]];
}
@end
