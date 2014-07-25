//
//  KSHWebViewController.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/25/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSHWebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (strong, nonatomic) NSString *url;

@end