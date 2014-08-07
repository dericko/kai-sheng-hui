//
//  KSHTaskDetailViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 8/5/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHTaskDetailViewController.h"
#import "KSHColorPicker.h"

@interface KSHTaskDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *startDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *endDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UILabel *industryLabel;

@end

@implementation KSHTaskDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleLabel.text = _task.name;
    self.contentLabel.text = _task.notes;
    self.contentLabel.font = [UIFont systemFontOfSize:18];
    
    _startDateLabel.text = [NSString stringWithFormat:@"开： %@", _task.startDate];
    _endDateLabel.text = [NSString stringWithFormat:@"关： %@", _task.endDate];
    _statusLabel.text = [_task getStatusName];
    [_statusLabel setBackgroundColor:[KSHColorPicker colorForTaskStatus:_task.status]];
    
    
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
