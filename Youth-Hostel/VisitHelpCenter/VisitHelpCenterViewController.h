//
//  VisitHelpCenterViewController.h
//  Youth-Hostel
//
//  Created by iqual on 6/14/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewController.h"




@interface VisitHelpCenterViewController : UIViewController<UIWebViewDelegate>
{
    
}
@property(nonatomic,retain)IBOutlet UIWebView *webView;
@property(nonatomic,retain)IBOutlet UIActivityIndicatorView *activityIndicator;
-(IBAction)btnSearchClick:(id)sender;

@end
