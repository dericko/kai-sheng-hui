//
//  KSHLoginViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/27/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHLoginViewController.h"
#import "KSHMessage.h"

#import "KSHCurrentUser.h"
#import "KSHUserProfileTableViewController.h"
#import "KSHUserDefaultsHelper.h"

#define LOGIN_PATH @"INSERT_LOGIN_PATH"

@interface KSHLoginViewController ()
@property (strong, nonatomic) IBOutlet UIButton *signInButton;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *password;

@property (strong, nonatomic) KSHCurrentUser *currentUser;

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
    [self loggedInSuccessfully];
    
# warning temporarily accepts login without making login request (for demonstration)
//    NSLog(@"signin button pressed");
//    [self disableSignInButton];
//    
//    // The hud will disable all input on the view (use the higest view possible in the view hierarchy)
//	HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
//	[self.navigationController.view addSubview:HUD];
//    
//	// Regiser for HUD callbacks so we can remove it from the window at the right time
//	HUD.delegate = self;
//    HUD.labelText = @"Signing In";
//    
//# warning internal HUD selector method "sendLoginRequest" uses async blocks, so stops loading signal before blocks are executed
//    [HUD showWhileExecuting:@selector(sendLoginRequest) onTarget:self withObject:nil animated:YES];

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
        if (_userManager) {
            
            // TODO: Start HUD
            
            NSLog(@"Logging in...");
            
            id params = @{
                          @"username": _email.text,
                          @"password": _password.text
                          };
            
            [_userManager.HTTPClient postPath:LOGIN_PATH
                                                 parameters:params
                                                    success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                        NSString *authToken = [responseObject objectForKey:@"auth_token"];
                                                        [self.currentUser setAuthToken:authToken];
                                                        // TODO: Stop HUD
                                                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                        [self enableSignInButton];
                                                        if (operation.response.statusCode == 500) {
                                                            // TODO: Stop HUD + 500 error
                                                            [KSHMessage displayErrorAlert:@"Something went wrong!" withSubtitle:@""];
                                                        } else {
                                                            NSData *jsonData = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
                                                            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                                                                 options:0
                                                                                                                   error:nil];
                                                            NSString *errorMessage = [json objectForKey:@"error"];
                                                            // TODO: Stop HUD + error
                                                            [KSHMessage displayErrorAlert:@"Problem logging in" withSubtitle:errorMessage];
                                                        }
                                                    }];
        }
    }
}


- (void)loggedInSuccessfully
{
    // Instantiate User entity with request
    [KSHUserDefaultsHelper userLogin];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
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
