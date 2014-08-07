//
//  KSHProjectDetailTableViewController.m
//  KaiShengHui
//
//  Created by Derick Olson on 8/5/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHProjectDetailTableViewController.h"
#import "KSHDetailIconTableViewCell.h"
#import "KSHContentTableViewCell.h"
#import "KSHTask.h"
#import "KSHTaskDetailViewController.h"

@interface KSHProjectDetailTableViewController ()
@property (strong, nonatomic) IBOutlet UILabel *titleLable;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeframeLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UILabel *priorityLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (strong, nonatomic) KSHTask *task;

@end

@implementation KSHProjectDetailTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _titleLable.text = _project.name;
    _dateLabel.text = [NSString stringWithFormat:@"%@", _project.updateDate];
    _timeframeLabel.text = [_project getTimeframeName];
    _statusLabel.text = [_project getStatusName];
    _priorityLabel.text = [_project getPriorityName];
    _descriptionLabel.text = _project.projectDescription;
    
    [_statusLabel setBackgroundColor:[KSHColorPicker colorForStatus:_project.status]];
    [_priorityLabel setBackgroundColor:[KSHColorPicker colorForPriority:_project.priority]];
    [_timeframeLabel setBackgroundColor:[KSHColorPicker colorForTimeframe:_project.timeframe]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 21)];
    headerLabel.text = @"Tasks";
    [[self.tableView headerViewForSection:0] addSubview:headerLabel];
}

- (void)assignCustomClassFields
{
    self.numberToLoad = @5;
    self.cellIdentifier = @"taskCell";
    self.entityName = @"Task";
    self.sortDescriptorKey = @"createDate";
    self.segueIdentifier = @"showTaskDetail";
    
    [super assignCustomClassFields];
}

- (void)loadCells
{
    if (_userManager) {
        [_userManager loadTasksForProject:_project
                                  success:^{
            // success
            [self.refreshControl endRefreshing];
            if (self.footerView){
                [(UIActivityIndicatorView *)[self.footerView viewWithTag:10] stopAnimating];
            }
            [self.tableView beginUpdates];
        } failure:^(NSError *error) {
            // Failure
            [self.refreshControl endRefreshing];
            if (self.footerView){
                [(UIActivityIndicatorView *)[self.footerView viewWithTag:10] stopAnimating];
            }
            [KSHMessage displayErrorAlert:@"An Error Has Occurred" withSubtitle:[error localizedDescription] forViewController:self];
        }];
    }
    
}

#pragma mark - Cell configuration

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    [super configureCell:cell atIndexPath:indexPath];
    
    _task = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Can typecast to 'cellIdentifer' type specified in Storyboard
    
    ((KSHContentTableViewCell *) cell).titleLabel.text = _task.name;
    ((KSHContentTableViewCell *) cell).detailLabel1.text = [_task getStatusName];
    [((KSHContentTableViewCell *) cell).detailLabel1 setBackgroundColor:[KSHColorPicker colorForStatus:_task.status]];
}

# pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    
    if ([segue.identifier isEqualToString:self.segueIdentifier]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        // send over Project
        KSHTaskDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.task = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        
        [destinationViewController setHidesBottomBarWhenPushed:NO];
    }
}

@end
