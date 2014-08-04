//
//  KSHLoginViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHLoginViewController.h"

#import "KSHUserProfileTableViewController.h"
#import "KSHUserDefaultsHelper.h"

#define LOGIN_PATH @"INSERT_LOGIN_PATH"

@interface KSHLoginViewController ()
@property (strong, nonatomic) IBOutlet UIButton *signInButton;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *password;

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
    NSLog(@"signin button pressed");
    [self disableSignInButton];

    [self login];
    
//    // The hud will disable all input on the view (use the higest view possible in the view hierarchy)
//	HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
//	[self.navigationController.view addSubview:HUD];
//    
//	// Regiser for HUD callbacks so we can remove it from the window at the right time
//	HUD.delegate = self;
//    HUD.labelText = @"Signing In";
//
//    [HUD showWhileExecuting:@selector(login) onTarget:self withObject:nil animated:YES];
}

- (IBAction)cancelButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [_delegate loginViewControllerDidCancel:self];
}

- (void)disableSignInButton
{
    [self.view endEditing:YES];

    [UIView animateWithDuration:0.5 animations:^{
        _signInButton.alpha = .5;
        [_signInButton setEnabled:NO];
    }];
}

- (void)enableSignInButton
{
    [_signInButton setEnabled:YES];
    _signInButton.alpha = 1;
}

- (void)login
{
    // Check for empty fields
    // TODO: check to determine email vs username
    if ([_email.text isEqualToString:@""] || [_password.text isEqualToString:@""]) {
        [KSHMessage displayWarningAlert:@"Empty Field" withSubtitle:@"Please check your email or password"];
        [self enableSignInButton];
    } else {
        if (_userManager) {
            
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self disableSignInButton];
    
    [self login];

    return YES;
}

#pragma mark MBProgressHUDDelegate

- (void)hudWasHidden:(MBProgressHUD *)hud {
	// Remove HUD from screen when the HUD is hidden
	[HUD removeFromSuperview];
	HUD = nil;
}

#pragma mark - AuthenticatedUserDelegate methods

- (void)userDidLogin:(KSHUser *)user
{
    // Hide modal
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)user:(KSHUser *)user didFailToLoginWithError:(NSError *)error
{
    // show error
}

@end
