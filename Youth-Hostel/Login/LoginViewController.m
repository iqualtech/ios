//
//  LoginViewController.m
//  Youth-Hostel
//
//  Created by iqual on 5/31/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import "LoginViewController.h"
#import "ZUUIRevealController.h"

@interface LoginViewController ()
{
//    LeftSlideBarViewController *leftBar;

    UIView *headerView;



}
@end

@implementation LoginViewController
@synthesize tfEmailAddress,tfPassword;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    appDel = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
     if ([self.navigationController.parentViewController respondsToSelector:@selector(revealGesture:)] && [self.navigationController.parentViewController respondsToSelector:@selector(revealToggle:)])
     {
         [[self navigationController] setNavigationBarHidden:NO animated:YES];
         [self.navigationController.navigationBar setTranslucent:NO];
         [self.navigationItem setHidesBackButton:YES animated:NO];
         headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 66)];
         [self.navigationController.navigationBar addSubview:headerView];
         UIImageView *headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,  self.view.frame.size.width, 66)];
         [headerImageView setImage:[UIImage imageNamed:@"login_title"]];
         UIButton *btnSlide = [UIButton buttonWithType:UIButtonTypeCustom];
         btnSlide.frame=CGRectMake(12, 15, 35, 35);
         [btnSlide setBackgroundColor:[UIColor clearColor]];
         [btnSlide setBackgroundImage:[UIImage imageNamed:@"ic_drawer"] forState:UIControlStateNormal];
         [btnSlide addTarget:self.navigationController.parentViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
         [headerView addSubview:headerImageView];
         [headerView addSubview:btnSlide];
     }
}


-(IBAction)loginButtonClick:(id)sender
{
    if ([tfEmailAddress.text isEqualToString:@"iqual@gmail.com"]&&[tfPassword.text isEqualToString:@"iqual"])
    {
        MyAccountViewController *myAccount = [[MyAccountViewController alloc]init];
        appDel.isLogin=TRUE;
        [headerView removeFromSuperview];
        [self.navigationController pushViewController:myAccount animated:YES];
    }
    
}

#pragma mark UitextField Delegate Method
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
//    activeTextField = textField;
    appDel.activeTextField = textField;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
