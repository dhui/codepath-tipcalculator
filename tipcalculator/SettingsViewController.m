//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Dale Hui on 2/25/14.
//  Copyright (c) 2014 Dale Hui. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;
@property (weak, nonatomic) IBOutlet UILabel *currentTipPercentageLabel;


- (void)loadDefaultValues;
- (IBAction)saveButtonTapped:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadDefaultValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadDefaultValues {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.defaultTipControl.selectedSegmentIndex = [defaults integerForKey:@"defaultTipIndex"];

    self.currentTipPercentageLabel.text = [self.defaultTipControl titleForSegmentAtIndex:self.defaultTipControl.selectedSegmentIndex];
}

- (IBAction)saveButtonTapped:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipControl.selectedSegmentIndex forKey:@"defaultTipIndex"];
    [defaults synchronize];

    [self loadDefaultValues];
}

@end
