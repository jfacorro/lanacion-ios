//
//  TodayCollectionViewCell.m
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/11/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "TodayCollectionViewCell.h"
#import <MapKit/MapKit.h>

@interface TodayCollectionViewCell()

@property (nonatomic, strong) IBOutlet MKMapView* mapView;
@property (nonatomic, strong) IBOutlet UILabel*   titulo;
@property (nonatomic, strong) IBOutlet UILabel*   subtitulo;
@property (nonatomic, strong) IBOutlet UIImageView* tarjetaPremium;
@property (nonatomic, strong) IBOutlet UIImageView* tarjetaClassic;
@property (nonatomic, strong) IBOutlet UIButton*    verButton;

@end

@implementation TodayCollectionViewCell


@end
