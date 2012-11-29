//
//  RouteMapWebViewAppDelegate.h
//  RouteMapWebView
//
//  Created by Neeraj kapoor on 29/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RouteMapWebViewViewController;

@interface RouteMapWebViewAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet RouteMapWebViewViewController *viewController;

@end
