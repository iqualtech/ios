//
//  MyReviewViewController.h
//  Youth-Hostel
//
//  Created by iqual on 6/14/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewController.h"

@interface MyReviewViewController : UIViewController<UITextViewDelegate>
{
    
}
@property(nonatomic,retain)IBOutlet UITextView *txtView;
-(IBAction)backButtonClick:(id)sender;
-(IBAction)btnSearchClick:(id)sender;

@end
