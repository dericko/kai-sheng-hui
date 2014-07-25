//
//  KSHWebViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/25/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHWebViewController.h"

@interface KSHWebViewController ()
@end

@implementation KSHWebViewController

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
    
    NSAssert(_url, @"No url found: make sure you set the *urlString before calling [super viewDidLoad]");
    [self requestWithURL:_url];
}

- (void)requestWithURL:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:requestObj];
}

@end
