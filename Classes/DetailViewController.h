//
//  DetailViewController.h
//  xkcd
//
//  Created by Steven Cheong on 11-07-14.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate> {
    
    //UIPopoverController *popoverController;
    //UIToolbar *toolbar;
	
	//UIWebView *webView;
    
    id detailItem;
    UILabel *detailDescriptionLabel;
	
	//NSString *comicNum;
}

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;

@property (nonatomic, retain) id detailItem;
@property (nonatomic, retain) IBOutlet UILabel *detailDescriptionLabel;

@end
