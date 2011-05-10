//
//  NearByViewController.m
//  iphone
//
//  Created by 인철 백 on 10. 8. 9..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import "NearByViewController.h"


@implementation NearByViewController

@synthesize mapView;


- (void)viewDidLoad {
    [super viewDidLoad];
	mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
	mapView.delegate = self;
	[self.view addSubview:mapView];
	
	mapView.showsUserLocation = TRUE;
	
	//mapView.mapType=MKMapTypeHybrid;
	
	//pinCounts = 0;
	
	CLLocationCoordinate2D center = {37.5665350,126.9779692};
	//center.latitude = 37.5665350;
	//center.longitude = 126.9779692;
	
	MKCircle *circle = [MKCircle circleWithCenterCoordinate:center radius:100];
	[mapView addOverlay:circle];
	[circle release];
	
	MKCoordinateRegion reg;
	reg.center = center;
	mapView.region = reg;
	
	/*
	MKCoordinateSpan span;
	
	span.latitudeDelta = 0.0001;
	span.longitudeDelta = 0.0001;
	reg.center = center;
	reg.span = span;
	mapView.region = reg;
	*/
	
	/*
	reg.center.latitude = 37.5665350;
	reg.center.longitude = 126.9779692;
	reg.span.latitudeDelta = 0.02;
	reg.span.longitudeDelta = 0.02;
	
	[mapView setRegion:reg animated:YES];
	 */
	
}

#pragma mark -
#pragma mark MKMapViewDelegate
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay{
    MKCircleView *circleView = [[MKCircleView alloc] initWithCircle:overlay];
    circleView.fillColor = [UIColor redColor];
    circleView.alpha = 0.3;
    return circleView;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[mapView release];
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

@end
