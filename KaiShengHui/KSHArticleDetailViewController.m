//
//  KSHArticleDetailViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticleDetailViewController.h"

@interface KSHArticleDetailViewController ()

@end

@implementation KSHArticleDetailViewController

@synthesize articleTitle;
@synthesize articleContent;
@synthesize articleImage;
@synthesize article;

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
    articleTitle.text = article.title;
    articleContent.text = article.content; // set up filter for html '&xxxxx' tags
    # warning should be saving this image rather than redownloading it!
    articleImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.i-ksh.com/files/fileUpload/%@", [[article valueForKey:@"imgURL"] description]]]]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
