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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signInButtonPressed:(id)sender
{
    // Check for blank field
    if ([_email.text isEqualToString:@""] || [_password.text isEqualToString:@""]) {
        // TODO: Send an alert to user
    }
    // Hide keyboard
    [self.email resignFirstResponder];
    [self.password resignFirstResponder];
    
    // Build request: url, username, password
    [self sendSignInRequest];
    
    // Send request (with user manager + JSON mapping): handle success-correct, success-wrong, failure
    
    // if (success-correct) reset username/password, instantiate user profile, set up segue
}

- (void)sendSignInRequest
{
//    if (_userManager) {
//# warning consider using managedObjectRequestOperation to integrate Core Data persistence
//        [_userManager postObject:<#(id)#> path:kUserLogInPath parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
//            // Check if password is correct
//        } failure:^(RKObjectRequestOperation *operation, NSError *error) {
//            // Networking error
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"An Error Has Occurred" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//            [alertView show];
//        }];
//    }
}

- (IBAction)backgroundTap:(id)sender {
    // minimize keyboard if user clicks outside input fields
    [self.view endEditing:YES];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // pass over the user object
}

@end
