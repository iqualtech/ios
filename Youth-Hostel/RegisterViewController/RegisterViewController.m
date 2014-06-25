//
//  RegisterViewController.m
//  Youth-Hostel
//
//  Created by iqual on 6/14/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import "RegisterViewController.h"
#import "ZUUIRevealController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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

    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 66)];
    
    [self.navigationController.navigationBar addSubview:headerView];
    
    UIImageView *headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,  self.view.frame.size.width, 66)];
    
    [headerImageView setImage:[UIImage imageNamed:@"register_logo"]];
    
    
    UIButton *btnSlide = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSlide.frame=CGRectMake(12, 15, 35, 35);
    [btnSlide setBackgroundImage:[UIImage imageNamed:@"ic_drawer"] forState:UIControlStateNormal];

    [btnSlide addTarget:self.navigationController.parentViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:headerImageView];
    [headerView addSubview:btnSlide];
}
-(IBAction)backButtonClick:(id)sender
{
    [headerView removeFromSuperview];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark UitextField Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //    activeTextField = textField;
    appDel.activeTextField = textField;
}
#pragma mark Checkbox button Click
-(IBAction)checkBoxButtonClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if ([btn isSelected])
    {
        [btn setSelected:NO];
    }
    else
    {
        [btn setSelected:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
