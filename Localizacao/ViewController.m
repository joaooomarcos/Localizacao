//
//  ViewController.m
//  Localizacao
//
//  Created by João Marcos on 26/02/15.
//  Copyright (c) 2015 João Marcos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CLLocationManagerDelegate>
@end

@implementation ViewController
@synthesize locationManager, locat;

CLLocationManager *locationManager;

- (void)viewDidLoad {
    
    //Alocar memória para o locationManager
    locationManager = [[CLLocationManager alloc]init];
    
    //Mostrar ao locationManager o quão exata deve ser a localização encontrada
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    //Determinar que a propriedade delegate do locationManager seja a instância da ViewController
    self.locationManager.delegate = self;
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    //Dizer ao locationManager para começar a procurar pela localização imediatamente
    [locationManager startUpdatingLocation];
    
    self.map.showsUserLocation=YES;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", [locations lastObject]);
    //Encontrar as coordenadas de localização atual
    locat = locations;
    CLLocationCoordinate2D loc = [[locat lastObject] coordinate];
    
    //Determinar região com as coordenadas de localização atual e os limites N/S e L/O no zoom em metros
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    
    //Mudar a região atual para visualização de forma animada
    [_map setRegion:region animated:YES ];
    
    [locationManager stopUpdatingLocation];
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    // Tratar o erro
}

- (IBAction)atualizar:(id)sender
{
    [locationManager startUpdatingLocation];
}
- (IBAction)pin:(id)sender {
    
    [locationManager startUpdatingLocation];
    
    CLLocationCoordinate2D loc = [[locat lastObject] coordinate];
    //Instanciar o MKPointAnnotation
    MKPointAnnotation *pm = [[MKPointAnnotation alloc]init];
    
    //Outra forma de Determinar a localização do MKPointAnnotation
    [pm setCoordinate: loc];
    
    [pm setTitle:@"Vc esta aqui! 😁"];
    
    //Adicionar pm ao mapa
    [_map addAnnotation:pm];
    
}
@end
