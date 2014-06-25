//
//  SlideMenuViewController.h
//  Youth-Hostel
//
//  Created by iqual on 6/14/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "SearchViewController.h"
#import "RegisterViewController.h"
#import "AppDelegate.h"
#import "RearViewCell.h"

@interface RearViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    AppDelegate *appDel;
}
@property(nonatomic,retain)IBOutlet UITableView *mainTableView;
-(IBAction)btnClick:(id)sender;
@end
