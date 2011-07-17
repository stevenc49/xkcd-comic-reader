//
//  DetailViewController.m
//  xkcd
//
//  Created by Steven Cheong on 11-07-14.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "RootViewController.h"


@interface DetailViewController ()
@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) NSString *comicNum;
- (void)configureView;
@end



@implementation DetailViewController

@synthesize webView, toolbar, detailItem, detailDescriptionLabel, comicNum;

#pragma mark -
#pragma mark Managing the detail item


- (NSURLRequest *)urlRequest
{
	NSString *urlString = @"http://xkcd.com/";
	
	self.comicNum = @"923";
	
	NSLog(@"%@", self.comicNum);
	
	if (self.detailItem) urlString = [urlString stringByAppendingFormat:@"%@/", self.detailItem];
	
	NSLog(@"%@", urlString);
	
	return [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
}

- (void)setDetailItem:(NSString *)newDetailItem
{
	if (detailItem != newDetailItem) {
		[detailItem release];
		detailItem = [newDetailItem copy];
	}
	
	NSLog(@"detailItem %@", self.detailItem);
	
	self.title = detailItem;
	if (webView.window) [webView loadRequest:[self urlRequest]];
}

- (void)loadView
{
	webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	webView.scalesPageToFit = YES;
	
	
	
	self.view = webView;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[webView loadRequest:[self urlRequest]];
}

/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.

- (void)setDetailItem:(id)newDetailItem {
    if (detailItem != newDetailItem) {
        [detailItem release];
        detailItem = [newDetailItem retain];
        
		NSLog(@"%d", self.detailItem);
		
        // Update the view.
        [self configureView];
    }
 */
//    if (self.popoverController != nil) {
//        [self.popoverController dismissPopoverAnimated:YES];
//    }        
//}


- (void)configureView {
    // Update the user interface for the detail item.
    detailDescriptionLabel.text = [detailItem description];   
}



#pragma mark -
#pragma mark Split view support

- (void)splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController: (UIPopoverController*)pc {
    
    barButtonItem.title = @"Root List";
    //NSMutableArray *items = [[toolbar items] mutableCopy];
    //[items insertObject:barButtonItem atIndex:0];
    //[toolbar setItems:items animated:YES];
    //[items release];
    //self.popoverController = pc;
}


// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController: (UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
    //NSMutableArray *items = [[toolbar items] mutableCopy];
    //[items removeObjectAtIndex:0];
    //[toolbar setItems:items animated:YES];
    //[items release];
    //self.popoverController = nil;
	
	
}


#pragma mark -
#pragma mark Rotation support

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


#pragma mark -
#pragma mark View lifecycle

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
 */

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.webView = nil;
}


#pragma mark -
#pragma mark Memory management

/*
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
*/

- (void)dealloc {
    [webView release];
    //[toolbar release];
    
    [detailItem release];
    [detailDescriptionLabel release];
    [super dealloc];
}

@end
