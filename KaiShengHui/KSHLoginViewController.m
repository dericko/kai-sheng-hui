//
//  KSHLoginViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHLoginViewController.h"

@interface KSHLoginViewController ()

@end

@implementation KSHLoginViewController

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
    // Do any additional setup after loading the view.
    
    // Tap gesture to minimuze keyboard
    UITapGestureRecognizer *tapBackground = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backgroundTap:)];
    [self.view addGestureRecognizer:tapBackground];
    
    // set textfield delegate for return button functionality
    _email.delegate = self;
    _password.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButton actions

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)signInButtonPressed:(id)sender
{
    NSLog(@"signin button pressed");
    [self.view endEditing:YES];
    
#warning Tempory bypass of login request for demonstration purposes
//    [self sendLoginRequest];
    [self loggedInSuccessfully];
}

- (void)sendLoginRequest
{
    if ([_email.text isEqualToString:@""] || [_password.text isEqualToString:@""]) {
        // TODO: send alert to user
        NSLog(@"Empty email or password field");
    } else {
        if (_loginManager) {
            NSLog(@"Making login request");
# warning consider using managedObjectRequestOperation to integrate Core Data persistence
            [_loginManager loginWithEmail:_email.text password:_password.text success:^(RKMappingResult *result){
                NSDictionary *resultData = [result dictionary];
                NSInteger success = [(NSNumber *) [resultData objectForKey:@"success"] integerValue]; // TODO: check "success" key with Sky
                if(success == 1) {
                    NSLog(@"Login successful");
                    [self loggedInSuccessfully];
                    _password.text=@"";
                } else {
                    NSString *error_msg = (NSString *) [resultData objectForKey:@"error_message"]; // TODO: check "error_message" key with Sky
                    // TODO: alert user
                }
            } failure:^(RKObjectRequestOperation *operation, NSError *error) {
                // failure message
            }];
        }

    }
}

- (void)loggedInSuccessfully
{
    // Instantiate User entity with request
    
    // Link via userID, authToken/cookie(?)
    
    // Move to next scene
    [self performSegueWithIdentifier:@"Profile" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // pass over the login object
}

#pragma mark - Delegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    [self sendLoginRequest];

    return YES;
}

@end
