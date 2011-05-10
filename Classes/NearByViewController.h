//
//  NearByViewController.h
//  iphone
//
//  Created by 인철 백 on 10. 8. 9..
//  Copyright 2010 okjsp iphone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface NearByViewController : UIViewController <MKReverseGeocoderDelegate,MKMapViewDelegate> {
	MKMapView* mapView;
	//int pinCounts;
}

@property (nonatomic,retain) IBOutlet MKMapView* mapView;



@end
