//
//  KSHLoginViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHLoginViewController.h"
#import "KSHWebViewController.h"
#import "KSHUserProfileTableViewController.h"

#define LOGIN_PATH @"INSERT_LOGIN_PATH"

@interface KSHLoginViewController ()
@property (strong, nonatomic) IBOutlet UIButton *signInButton;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loginIndicator;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scrollViewHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *scrollViewTopConstraint;
@end

@implementation KSHLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Setup view
    [self enableSignInButton];
    
    // Setup networking
    _userManager = [KSHUserManager sharedManager];
    _userManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    self.managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;

    // Tap gesture to minimuze keyboard
    UITapGestureRecognizer *tapBackground = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backgroundTap:)];
    [self.view addGestureRecognizer:tapBackground];
    
    // set textfield delegate for return button functionality
    _email.delegate = self;
    _password.delegate = self;
}

#pragma mark - Login

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)signInButtonPressed:(id)sender
{
    [self disableSignInButton];

    [self login];
    
}

- (IBAction)cancelButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [_delegate loginViewControllerDidCancel:self];
}

- (void)disableSignInButton
{
    // Hide keyboard
    [self.view endEditing:YES];

    // Animate indicator
    [_loginIndicator startAnimating];
    
    // Disable signin button
    [_signInButton.titleLabel setHidden:YES];
    [_signInButton setEnabled:NO];
    _signInButton.alpha = .5;
}

- (void)enableSignInButton
{
    // Show keyboard
    [self.view endEditing:NO];
    
    // End indicator animation
    [_loginIndicator stopAnimating];
    
    // Enable signin button
    [_signInButton.titleLabel setHidden:NO];
    [_signInButton setEnabled:YES];
    _signInButton.alpha = 1;
}

- (void)login
{
    
    // Check for empty fields
    // TODO: check to determine email vs username
    if ([_email.text isEqualToString:@""] || [_password.text isEqualToString:@""]) {
        [KSHMessage displayWarningAlert:@"Empty Field" withSubtitle:@"Please fill in your username and password" forViewController:self];
        [self enableSignInButton];
    } else {
        if (_userManager) {
            [self disableSignInButton];
            
            // Login
            KSHUserManager *userManager = [KSHUserManager sharedManager];
            [userManager loginWithUsername:_email.text password:_password.text delegate:self];
            }
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"registerUser"]) {
        KSHWebViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.url = @"http://www.iksh.com/consultant/register/initiative";
    }
}

#pragma mark - UITextFieldDelegate and actions

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _scrollViewHeightConstraint.constant = 450;
    _scrollViewTopConstraint.constant = -60;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _scrollViewHeightConstraint.constant = 568;
    _scrollViewTopConstraint.constant = 0;
}
- (IBAction)didEnterUsername:(id)sender {
    [_password becomeFirstResponder];
}

- (IBAction)didEnterPassword:(id)sender {
    [self login];
}


#pragma mark - AuthenticatedUserDelegate methods

- (void)userDidLogin:(KSHUser *)user
{
    // Hide modal
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)user:(KSHUser *)user didFailToLoginWithError:(NSError *)error
{
    [self enableSignInButton];
    [KSHMessage displayErrorAlert:@"There was a problem logging in:" withSubtitle:[error localizedDescription] forViewController:self];
}

@end
