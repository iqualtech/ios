//
//  SearchViewController.m
//  Youth-Hostel
//
//  Created by iqual on 6/7/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import "SearchViewController.h"
#import "ActionSheetPicker.h"
#import "NSDate+TCUtils.h"
#import "ActionSheetPickerCustomPickerDelegate.h"
#import "ZUUIRevealController.h"

@interface SearchViewController ()
{
    UIView *headerView;
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

- (void)dateWasSelected:(NSDate *)selectedDate element:(id)element;

@end

@implementation SearchViewController
@synthesize tfCurrentLocation;
@synthesize actionSheetPicker = _actionSheetPicker;
@synthesize selectedDate = _selectedDate;
@synthesize selectedIndex = _selectedIndex;

@synthesize btnSelectedDate,btnGuests,btnNights;
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
    arrNights =[[NSMutableArray alloc]init];
    arrGuests =[[NSMutableArray alloc]init];

    for (int i=1; i<=100; i++)
    {
        [arrNights addObject:[NSString stringWithFormat:@"%d",i]];
        if (i<21)
        {
            [arrGuests addObject:[NSString stringWithFormat:@"%d",i]];
 
        }
    }
    
    self.selectedDate = [NSDate date];

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
    [headerView addSubview:headerImageView];
    [headerView addSubview:btnSlide];
    [headerView addSubview:imgIconLauncher];
    [headerView addSubview:btnSearch];
   
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    

}
//Get Current location of user
-(IBAction)btnCurrentLocationClick:(id)sender
{
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
}

//Select Date
#pragma mark datePicker
- (IBAction)selectADate:(UIControl *)sender
{
    [activeTextField resignFirstResponder];

    _actionSheetPicker = [[ActionSheetDatePicker alloc] initWithTitle:@"" datePickerMode:UIDatePickerModeDate selectedDate:self.selectedDate target:self action:@selector(dateWasSelected:element:) origin:sender];
    [self.actionSheetPicker addCustomButtonWithTitle:@"Today" value:[NSDate date]];
    [self.actionSheetPicker addCustomButtonWithTitle:@"Yesterday" value:[[NSDate date] TC_dateByAddingCalendarUnits:NSDayCalendarUnit amount:-1]];
    self.actionSheetPicker.hideCancel = YES;
    [self.actionSheetPicker showActionSheetPicker];
}
- (void)dateWasSelected:(NSDate *)selectedDate element:(id)element
{
    self.selectedDate = selectedDate;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEE MMM dd yyyy"];
    NSString *dateString = [dateFormat stringFromDate:self.selectedDate ];
    [btnSelectedDate setTitle:dateString forState:UIControlStateNormal];
}


#pragma mark UItextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeTextField = textField;
    appDel.activeTextField = textField;
}


//Search button
#pragma mark Search Button Click

- (IBAction)btnSearchNowClick:(id)sender
{
    SearchResultViewController *searchResult = [[SearchResultViewController alloc]init];
    searchResult.dictSearchPlace =(NSMutableDictionary *) placemark.addressDictionary;
    [locationManager stopUpdatingLocation];
    [headerView removeFromSuperview];
    [self.navigationController pushViewController:searchResult animated:YES];
}
#pragma mark Night Button Click

- (IBAction)btnNightsClick:(id)sender
{
    [ActionSheetStringPicker showPickerWithTitle:@"Select Nights" rows:arrNights initialSelection:self.selectedIndex target:self successAction:@selector(btnNightsWasSelected:element:) cancelAction:@selector(actionPickerCancelled:) origin:sender];
}
- (void)btnNightsWasSelected:(NSNumber *)selectedIndex element:(id)element
{
    self.selectedIndex = [selectedIndex intValue];
    [btnNights setTitle:[NSString stringWithFormat:@"%@",[arrNights objectAtIndex:self.selectedIndex]] forState:UIControlStateNormal];
}
- (void)actionPickerCancelled:(id)sender
{
    NSLog(@"Delegate has been informed that ActionSheetPicker was cancelled");
}
#pragma mark Guest Button Click

- (IBAction)btnGuestsClick:(id)sender
{
    [ActionSheetStringPicker showPickerWithTitle:@"Select Guests" rows:arrGuests initialSelection:self.selectedIndex target:self successAction:@selector(btnGuestsWasSelected:element:) cancelAction:@selector(actionPickerCancelled:) origin:sender];
}
-(void)btnGuestsWasSelected:(NSNumber *)selectedIndex element:(id)element
{
    self.selectedIndex = [selectedIndex intValue];
    [btnGuests setTitle:[NSString stringWithFormat:@"%@",[arrGuests objectAtIndex:self.selectedIndex]] forState:UIControlStateNormal];
}


#pragma mark get Current Location detail
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    
    // Reverse Geocoding
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0)
        {
            placemark = [placemarks lastObject];
            
            [tfCurrentLocation setText:[NSString stringWithFormat:@"%@ %@ %@ %@",[placemark.addressDictionary valueForKey:@"Street"],[placemark.addressDictionary valueForKey:@"City"],[placemark.addressDictionary valueForKey:@"State"],[placemark.addressDictionary valueForKey:@"Country"]]];
        }
        else
        {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
}

@end
