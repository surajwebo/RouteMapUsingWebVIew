//
//  RouteMapWebViewViewController.m
//  RouteMapWebView
//
//  Created by Neeraj kapoor on 29/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "RouteMapWebViewViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation RouteMapWebViewViewController
@synthesize webViewForMap;
@synthesize activityIndicator;

- (void)dealloc
{
    [super dealloc];
    [webViewForMap release];
    [activityIndicator release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel *lblTitle = [[UILabel alloc] init];
    [lblTitle setFrame:CGRectMake(0, 10, 320, 25)];
    [lblTitle setText:@"Sourcre To Destination Route Map"];
    [lblTitle setTextAlignment:UITextAlignmentCenter];
    [lblTitle setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:lblTitle];
    
    // Show map with Route from Source to Destination using Google Map API
    
    NSString *sourceAddress = @"Kolhapur, Maharashtra";
    NSString* address = @"Pune, Maharashtra";
    NSString* url = [NSString stringWithFormat: @"http://maps.google.com/maps?saddr=%@&daddr=%@&mode=driving",[sourceAddress stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
                     [address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    //CLLocationCoordinate2D currentLocation = {19.12, 73.02};
    // NSString* url = [NSString stringWithFormat: @"http://maps.google.com/maps?saddr=%f,%f&daddr=%@&mode=driving",currentLocation.latitude, currentLocation.longitude,[address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"URL: %@", url);
    
    webViewForMap = [[UIWebView alloc] init];
    [webViewForMap setFrame:CGRectMake(10, 35, 300, 420)];
    [webViewForMap loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    webViewForMap.delegate = self;
    webViewForMap.layer.cornerRadius = 8.0f;
    webViewForMap.layer.masksToBounds = YES;
    webViewForMap.layer.borderWidth = 2.0f;
    webViewForMap.layer.borderColor = [UIColor blueColor].CGColor;
    [self.view addSubview:webViewForMap];
    
    
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
	activityIndicator.center = self.view.center;
	[self.view addSubview: activityIndicator];
}

#pragma mark WEBVIEW Methods

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	// starting the load, show the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	[activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	// finished loading, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	// load error, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
	// report the error inside the webview
	NSString* errorString = [NSString stringWithFormat:
							 @"<html><center><br /><br /><font size=+5 color='red'>Error<br /><br />Your request %@</font></center></html>",
							 error.localizedDescription];
	[webViewForMap loadHTMLString:errorString baseURL:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
