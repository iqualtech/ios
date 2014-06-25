//
//  PersonalInfoViewController.m
//  Youth-Hostel
//
//  Created by iqual on 6/17/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "ZUUIRevealController.h"
@interface PersonalInfoViewController ()
{
    UIView *headerView;
}
@end

@implementation PersonalInfoViewController
@synthesize scrollView,btnCountry;
@synthesize btnMale,btnFemale,btnTime,datePickerView,datePicker;
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
    [scrollView setContentSize:CGSizeMake(320, 750)];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    appDel = (AppDelegate *)[[UIApplication sharedApplication]delegate];
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
//    [btnSlide addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
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
    
    
    
    NSHTTPURLResponse *response = nil;
    NSString *jsonUrlString = [NSString stringWithFormat:@"http://restcountries.eu/rest/v1"];
    NSURL *url = [NSURL URLWithString:[jsonUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    //-- Get request and response though URL
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    //-- JSON Parsing
    NSMutableArray *result = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"Result = %@",[[result objectAtIndex:0]valueForKey:@"name"]);
    arrCountry = [[NSMutableArray alloc]init];
    
    arrGender = [[NSMutableArray alloc]initWithObjects:@"1",@"2", nil];

    for (int i=0; i<[result count]; i++)
    {
        NSString *str=[[result objectAtIndex:i]valueForKey:@"name"];
        
       NSString *newStr = [self stringByRemovingQuotationMarks:str];
        
        [arrCountry addObject:newStr];
    }
    NSLog(@"Country = %@",arrCountry);

    
}

- (NSString *)stringByRemovingQuotationMarks:(NSString *)inputStr
{
	NSString *newStr = inputStr;
	if (newStr.length > 0) {
		// Start quotation mark
		if ([newStr characterAtIndex:0] == '"') {
			newStr = [newStr substringFromIndex:1];
		}
		// End quotation mark
		if ([newStr characterAtIndex:(newStr.length - 1)] == '"') {
			newStr = [newStr substringToIndex:(newStr.length - 1)];
		}
	}
	return newStr;
}

#pragma mark Country Button Click
-(IBAction)btnCountryClick:(id)sender
{
    [ActionSheetStringPicker showPickerWithTitle:@"Select Country" rows:arrCountry initialSelection:self.selectedIndex target:self successAction:@selector(btnCountryWasSelected:element:) cancelAction:@selector(actionPickerCancelled:) origin:sender];
}
- (void)btnCountryWasSelected:(NSNumber *)selectedIndex element:(id)element
{
    self.selectedIndex = [selectedIndex intValue];
    [btnCountry setTitle:[NSString stringWithFormat:@"%@",[arrCountry objectAtIndex:self.selectedIndex]] forState:UIControlStateNormal];
}
- (void)actionPickerCancelled:(id)sender
{
    NSLog(@"Delegate has been informed that ActionSheetPicker was cancelled");
}
#pragma mark Female Button Click
-(IBAction)btnFemaleClick:(id)sender
{
     [ActionSheetStringPicker showPickerWithTitle:@"Select Female" rows:arrGender initialSelection:self.selectedIndex target:self successAction:@selector(btnFemaleWasSelected:element:) cancelAction:@selector(actionPickerCancelled:) origin:sender];
}
- (void)btnFemaleWasSelected:(NSNumber *)selectedIndex element:(id)element
{
    self.selectedIndex = [selectedIndex intValue];
    [btnFemale setTitle:[NSString stringWithFormat:@"%@",[arrGender objectAtIndex:self.selectedIndex]] forState:UIControlStateNormal];
}

#pragma mark Male Button Click
-(IBAction)btnMaleClick:(id)sender
{
    [ActionSheetStringPicker showPickerWithTitle:@"Select Male" rows:arrGender initialSelection:self.selectedIndex target:self successAction:@selector(btnMaleWasSelected:element:) cancelAction:@selector(actionPickerCancelled:) origin:sender];
}

- (void)btnMaleWasSelected:(NSNumber *)selectedIndex element:(id)element
{
    self.selectedIndex = [selectedIndex intValue];
    [btnMale setTitle:[NSString stringWithFormat:@"%@",[arrGender objectAtIndex:self.selectedIndex]] forState:UIControlStateNormal];
}

#pragma mark Time Button click
-(IBAction)btnTimeClick:(id)sender
{
    
    datePickerView.frame = CGRectMake(0, self.view.frame.size.height-datePickerView.frame.size.height, self.view.frame.size.width, datePickerView.frame.size.height);
    [self.view addSubview:datePickerView];
    
    
    
    
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];

    
    
}
- (void)dateChanged:(id)sender
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *currentTime = [dateFormatter stringFromDate:self.datePicker.date];
    NSLog(@"%@", currentTime);
    [btnTime setTitle:currentTime forState:UIControlStateNormal];
}

-(IBAction)btnCancel_PickerClick:(id)sender
{
    [datePickerView removeFromSuperview];
}
-(IBAction)btnDone_PickerClick:(id)sender
{
    [datePickerView removeFromSuperview];    
}




-(IBAction)backButtonClick:(id)sender
{
    [headerView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    appDel.activeTextField = textField;
}
-(IBAction)btnNextClick:(id)sender
{
    PaymentOptionViewController *paymentOption = [[PaymentOptionViewController alloc]init];
    [headerView removeFromSuperview];
    [self.navigationController pushViewController:paymentOption animated:YES];
}
-(IBAction)btnCheckBoxClick:(id)sender
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

-(IBAction)btnSearchClick:(id)sender
{
    SearchViewController *searchView =[[SearchViewController alloc]init];
    [headerView removeFromSuperview];
    [self.navigationController pushViewController:searchView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
