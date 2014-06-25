//
//  HotelsDescriptionViewController.m
//  Youth-Hostel
//
//  Created by iqual on 6/17/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import "HotelsDescriptionViewController.h"
#import "ZUUIRevealController.h"
@interface HotelsDescriptionViewController ()
{
    UIView *headerView;
}
@end

@implementation HotelsDescriptionViewController
@synthesize scrollView,popView,view1,view2,lbl1,lbl2,lbl3;
@synthesize btnReadMore;


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
    float contentHeight = view1.frame.size.height + view2.frame.size.height +50;
    scrollView.contentSize = CGSizeMake(320, contentHeight);
    
    
    
    
    [self.navigationController.navigationBar setTranslucent:NO];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [self.navigationItem setHidesBackButton:YES animated:NO];
    
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 66)];
    [self.navigationController.navigationBar addSubview:headerView];
    UIImageView *headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,  self.view.frame.size.width, 66)];
    [headerImageView setImage:[UIImage imageNamed:@"header.png"]];
    
    UIButton *btnSlide = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSlide.frame=CGRectMake(12, 15, 35, 35);
    [btnSlide setBackgroundImage:[UIImage imageNamed:@"ic_drawer"] forState:UIControlStateNormal];
    [btnSlide addTarget:self.navigationController.parentViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImageView *imgIconLauncher = [[UIImageView alloc]init];
    imgIconLauncher.image=[UIImage imageNamed:@"icon_launcher"];
    imgIconLauncher.frame = CGRectMake(60, 15, 35, 35);
    
    UIButton *btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSearch.frame=CGRectMake(270, 15, 35, 35);
    [btnSearch setBackgroundImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
    [btnSearch addTarget:self action:@selector(btnSearchClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [headerView addSubview:headerImageView];
    [headerView addSubview:btnSlide];
    [headerView addSubview:imgIconLauncher];
    [headerView addSubview:btnSearch];
    
    
    view1.frame = CGRectMake(0, 60, view1.frame.size.width, view1.frame.size.height);
    [scrollView addSubview:view1];
    view2.frame = CGRectMake(0, 440, view2.frame.size.width, view2.frame.size.height);
    [scrollView addSubview:view2];


    lbl1.text =  @"\u2022 Free Breakfast \u2022 Free WiFi Connection \u2022 Linen";
    lbl2.text =  @"\u2022 Credit card facilities \u2022 Lockers \u2022 Luggage storage";
    lbl3.text =  @"\u2022 Guest Kitchen \u2022 TV \u2022 Access to telephone \u2022 24 hours...";
    

    
    
}
-(IBAction)backButtonClick:(id)sender
{
    [headerView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)btnBookNowClick:(id)sender
{
    BookingDetailViewController *bookingDetail = [[BookingDetailViewController alloc]init];
    [headerView removeFromSuperview];
    [self.navigationController pushViewController:bookingDetail animated:YES];
}
-(IBAction)btnMap_DirectionClick:(id)sender
{
    Map_DirectionViewController *map_direction = [[Map_DirectionViewController
                                                   alloc]init];
    [headerView removeFromSuperview];
    [self.navigationController pushViewController:map_direction animated:YES];
}
-(IBAction)btnReviewClick:(id)sender
{
    [popView setFrame:CGRectMake(25, 50, popView.frame.size.width, popView.frame.size.height)];
    [self.view addSubview: popView];
}
-(IBAction)btnOKClick:(id)sender
{
    [popView removeFromSuperview];
}
-(IBAction)btnCancelClick:(id)sender
{
    [popView removeFromSuperview];    
}

-(IBAction)btnSearchClick:(id)sender
{
    SearchViewController *searchView =[[SearchViewController alloc]init];
    [headerView removeFromSuperview];
    [self.navigationController pushViewController:searchView animated:YES];
}


#pragma mark UitextView delagate method
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

#pragma mark Button ReadMore Click
-(IBAction)btnReadMoreClick:(id)sender
{
    
    if ([btnReadMore.titleLabel.text isEqualToString:@"Read more"])
    {
        view2.frame = CGRectMake(0, 500, view2.frame.size.width, view2.frame.size.height);
        float contentHeight = view1.frame.size.height + view2.frame.size.height +100;
        scrollView.contentSize = CGSizeMake(320, contentHeight);
        [btnReadMore setTitle:@"Back" forState:UIControlStateNormal];
       
    }
    else if ([btnReadMore.titleLabel.text isEqualToString:@"Back"])
    {
        view2.frame = CGRectMake(0, 440, view2.frame.size.width, view2.frame.size.height);

        float contentHeight = view1.frame.size.height + view2.frame.size.height +50;
        scrollView.contentSize = CGSizeMake(320, contentHeight);
        [btnReadMore setTitle:@"Read more" forState:UIControlStateNormal];
       
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
