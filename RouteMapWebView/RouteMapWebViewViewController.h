//
//  RouteMapWebViewViewController.h
//  RouteMapWebView
//
//  Created by Neeraj kapoor on 29/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RouteMapWebViewViewController : UIViewController <UIWebViewDelegate> {
    UIWebView *webViewForMap;
    UIActivityIndicatorView *activityIndicator;
}
@property (nonatomic, retain) UIWebView *webViewForMap;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;

@end
