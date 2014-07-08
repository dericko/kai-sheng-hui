//
//  KSHLoginViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHLoginViewController.h"
#import "KSHMessage.h"

#import "KSHLogin.h"
#import "KSHUser+guestUser.h"
#import "KSHArticle.h"
#import "KSHLikeDislike.h"

#import "KSHUserProfileTableViewController.h"

@interface KSHLoginViewController ()
@property (strong, nonatomic) IBOutlet UIButton *signInButton;

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
    
    [self enableSignInButton];
    [KSHMessage displayMessageAlert:@"Hi There!" withSubtitle:@"Please sign in with your 凯盛汇 credentials"];
    
    // Login manager instance
    NSLog(@"instantiate login manager...");
    _loginManager = [KSHLoginManager sharedManager];
    NSLog(@"instantiate login manager...DONE");
    _loginManager.managedObjectStore = [RKManagedObjectStore defaultStore];
    // set managed object context to main queue
    self.managedObjectContext = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;

    
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
    [self disableSignInButton];
    
    // The hud will disable all input on the view (use the higest view possible in the view hierarchy)
	HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[self.navigationController.view addSubview:HUD];
    
	// Regiser for HUD callbacks so we can remove it from the window at the right time
	HUD.delegate = self;
    HUD.labelText = @"Signing In";
    
# warning internal HUD selector method "sendLoginRequest" uses async blocks, so stops loading signal before blocks are executed
    [HUD showWhileExecuting:@selector(sendLoginRequest) onTarget:self withObject:nil animated:YES];

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

# pragma mark - Login

- (void)sendLoginRequest
{
    if ([_email.text isEqualToString:@""] || [_password.text isEqualToString:@""]) {
        [KSHMessage displayWarningAlert:@"Empty Field" withSubtitle:@"Please check your email or password"];
        [self enableSignInButton];
    } else {
        if (_loginManager) {
            NSLog(@"Making login request");
            
# warning better to send this off to the login manager...
//            KSHLogin *userLogin = [NSEntityDescription insertNewObjectForEntityForName:@"Login" inManagedObjectContext:[self managedObjectContext]];
//            [userLogin setEmail:_email.text];
//            [userLogin setPassword:_password.text];
//            
//            [_loginManager loginWithEmail:userLogin success:^(RKMappingResult *result){
//                NSDictionary *resultData = [result dictionary];
//                NSInteger success = [(NSNumber *) [resultData objectForKey:@"success"] integerValue]; // TODO: check "success" key with Sky
//                if(success == 1) {
//                    NSLog(@"Login successful");
//                    [self loggedInSuccessfully];
//                    _password.text=@"";
//                } else {
//                    NSString *error_msg = (NSString *) [resultData objectForKey:@"error_message"]; // TODO: check "error_message" key with Sky
//                    [KSHMessage displayErrorAlert:@"Login failed" withSubtitle:@"Please check your email and password"];
//                }
//            } failure:^(RKObjectRequestOperation *operation, NSError *error) {
//                [KSHMessage displayErrorAlert:@"Error" withSubtitle:[error localizedDescription]];
//            }];
//        }

        // Make request here (rather than _loginManager method) due to error with block pasing
            KSHLogin *userLogin = [NSEntityDescription insertNewObjectForEntityForName:@"LoginRequest" inManagedObjectContext:[self managedObjectContext]];
    
            [userLogin setEmail:_email.text];
            [userLogin setPassword:_password.text];
    
            [_loginManager postObject:userLogin
                                 path:kLoginPath
                           parameters:nil
                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                  NSDictionary *resultData = [mappingResult dictionary];
                                  NSInteger success = [(NSNumber *) [resultData objectForKey:@"success"] integerValue]; // TODO: check "success" key with Sky
                                  if(success == 1) {
                                      NSLog(@"Login successful");
                                      [self loggedInSuccessfully];
                                      _password.text=@"";
                                  } else {
                                      NSString *error_msg = (NSString *) [resultData objectForKey:@"error_message"];
                                      // TODO: check "error_message" key with Sky
                                      [KSHMessage displayErrorAlert:@"Login failed" withSubtitle:@"Please check your email and password"];
                                      
                                      [KSHMessage displayMessageAlert:@"It appears that there was a problem logging in" withSubtitle:@"Would you like to try as a guest?" withButton:@"OK" forCallbackBlock:^{
                                          [self loginAsGuest];
                                      }];
                                      
                                      [self enableSignInButton];
                                  }
                              }
                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                  [KSHMessage displayErrorAlert:@"Networking Error" withSubtitle:@""];
                                  [KSHMessage displayMessageAlert:@"It appears that there was a problem logging in" withSubtitle:@"Would you like to try as a guest?" withButton:@" OK " forCallbackBlock:^{
                                      [self loginAsGuest];
                                  }];
                                  [self enableSignInButton];
                                  NSLog([NSString stringWithFormat:@"Error: %@", [error localizedDescription]]);
                              }];
        }
    }
}

- (void)loginAsGuest
{
    KSHUser *guestUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[self managedObjectContext]];
   
    [guestUser setupGuestUserWithContext:[self managedObjectContext]];
    
    _user = guestUser;
    
    //TODO: implement guest login
    NSLog(@"booooooom guest login!");
    [self performSegueWithIdentifier:@"showProfile" sender:self.view];
}

- (void)loggedInSuccessfully
{
    sleep(3);
    // Instantiate User entity with request
    
    // Link via userID, authToken/cookie(?)
    
    // Move to next scene
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // pass over the login object
    if ([segue.identifier isEqualToString:@"showProfile"]) {
        KSHUserProfileTableViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.user = _user;
    }
}

#pragma mark - Delegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self disableSignInButton];
    
    [self sendLoginRequest];

    return YES;
}

#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden:(MBProgressHUD *)hud {
	// Remove HUD from screen when the HUD was hidded
	[HUD removeFromSuperview];
	HUD = nil;
}

@end
