//
//  AddCourseInfo.m
//  TimeTable
//
//  Created by moeen ahmad on 5/15/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import "AddCourseInfo.h"
#import "CourseStore.h"
@interface AddCourseInfo ()


@end

@implementation AddCourseInfo{
    NSString *crse;
   
    UIColor *recent;
  
    BOOL shouldRemind;
    NSDate *dueDate;
}


///synthesize properties

@synthesize CourseNameTextField, CrseColor, doneBarButton;
@synthesize delegate;
@synthesize itemToEdit;
@synthesize switchControl;
@synthesize dueDateLabel;



///we display current date and time when we present the additemvewcontroller to user
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        crse = @"";
        shouldRemind = NO;
        dueDate = [NSDate date];
       
    
    }
    return self;
}



///we enable done bar button only when text field length is more than one character.
- (void)updateDoneBarButton
{
    self.doneBarButton.enabled = ([CourseNameTextField.text length] > 0);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.itemToEdit != nil) {
        self.title = @"Edit Course Detail";
        
    } else
        
        self.title = @"Add Course Detail";
  
    self.CourseNameTextField.text = crse;
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"I1.png"]];
    
   // self.CrseColor.backgroundColor= colr1;
    
    
    self.switchControl.on = shouldRemind;
   [self updateDoneBarButton];
    [self updateDueDateLabel];
  // [self updateCrseBackground];
    
   
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateCrseBackground];
    
        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
        [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
   
    
    
    if (self.title != NSLocalizedString(@"Edit Course Detail", nil)) {
        [self.CourseNameTextField becomeFirstResponder];
        
    }else
        [self.CourseNameTextField resignFirstResponder];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor whiteColor];
    
    // if you have index/header text in your tableview change your index text color
    UITableViewHeaderFooterView *headerIndexText = (UITableViewHeaderFooterView *)view;
    [headerIndexText.textLabel setTextColor:[UIColor whiteColor]];
    
}

/// method to call addItemViewControllerDidCancel method when cancel button pressed

- (IBAction)cancel
{
    [self.delegate addItemViewControllerDidCancel:self];
}


/// method to call didFinishAddingItem method when Done button pressed


- (IBAction)done
{
    
  
    
    
    if (self.itemToEdit == nil) {
        CourseStore *item = [[CourseStore alloc] init];
        item.coursename = self.CourseNameTextField.text;
        recent = self.CrseColor.backgroundColor;
        NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:recent];
             item.coursecolor = theData;
        item.checked = NO;
                      
        item.shouldRemind = self.switchControl.on;
        item.dueDate = dueDate;
        [item scheduleNotification];
        [self.delegate addItemViewController:self didFinishAddingItem:item];
    } else
    {
        self.itemToEdit.coursename = self.CourseNameTextField.text;
        recent = self.CrseColor.backgroundColor;
        NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:recent];
        
        self.itemToEdit.coursecolor = theData;
        
        self.itemToEdit.shouldRemind = self.switchControl.on;
         self.itemToEdit.dueDate = dueDate;
        [self.itemToEdit scheduleNotification];
        [self.delegate addItemViewController:self didFinishEditingItem:self.itemToEdit];
    }
}



///we take not when the user tap on the UISwitch and we create local notification only if it is turned on
- (IBAction)switchChanged:(UISwitch *)sender
{
    shouldRemind = sender.on;
    
    
}



///optionally we can dismiss keyboard if the user starts to scroll the tableview

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.CourseNameTextField resignFirstResponder];
   // [self.CrseColor resignFirstResponder];
    
}




///to prevent the uitableview cell turns blue when user taps on it

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (indexPath.section == 1 && indexPath.row == 0)  {
        [self performSegueWithIdentifier:@"PickColor" sender:self];
    }
    
    if (indexPath.section == 2 && indexPath.row == 1)  {
        [self performSegueWithIdentifier:@"PickDate" sender:self];
    }
    
    if (indexPath.row == 1) {
        return indexPath;
    } else {
        return nil;
    }
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

///release te memory by setting nil to these fields as we no loner need them

- (void)viewDidUnload
{
    [self setCourseNameTextField:nil];
   [self setCrseColor:nil];
    [self setDoneBarButton:nil];
    [self setSwitchControl:nil];
    [self setDueDateLabel:nil];
    
   
    [super viewDidUnload];
}


///we present stored item if the user editing an item

- (void)setItemToEdit:(CourseStore *)newItem
{
    if (itemToEdit != newItem) {
        itemToEdit = newItem;
       crse = itemToEdit.coursename;
        NSData *data = itemToEdit.coursecolor;
     
        recent = (UIColor *)[NSKeyedUnarchiver unarchiveObjectWithData:data];
        CrseColor.backgroundColor = recent;
        
        shouldRemind = itemToEdit.shouldRemind;
        dueDate = itemToEdit.dueDate;
    }
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    self.doneBarButton.enabled = ([newText length]>0);
    
    return YES;
    
}


///we use prepare for segue method to display date picker controller

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickDate"]) {
        DatePickerViewController *controller = segue.destinationViewController;
        controller.delegate = self;
        controller.date = dueDate;
    }
    if ([segue.identifier isEqualToString:@"PickColor"]) {
       ViewController *controller1 = segue.destinationViewController;
        controller1.delegate = self;
        
       controller1.sampleLabel.backgroundColor = recent;
        
        [self updateCrseBackground];
    }
    
  
    
    
}




-(void)updateCrseBackground
{
  self.CrseColor.backgroundColor = recent;
   
}
/// NSdate formetter to fprmat date and update the label when user picked different date
- (void)updateDueDateLabel
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    self.dueDateLabel.text = [formatter stringFromDate:dueDate];
    
    /*
     NSDateFormatter *df = [[NSDateFormatter alloc] init];
     [df setDateFormat:@"EEE, dd MMMM yyyy HH:mm:ss PDT"]; //Tue, 23 Jul 2013 15:00:05 PDT
     [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"de"]];
     */
    
}



-(void)ColorPick:(ViewController *)picker didPickcolor:(UIColor *)color
{
   recent= color;
 [self updateCrseBackground];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)ColorPickerDidCancel:(ViewController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


///we use delegate method from date view controller. We don't store any new info if the user press cancel button
- (void)datePickerDidCancel:(DatePickerViewController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


///we use delegate method from date view controller. We store the new date when the user press done button

- (void)datePicker:(DatePickerViewController *)picker didPickDate:(NSDate *)date
{
    dueDate = date;
    [self updateDueDateLabel];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewDidAppear:(BOOL)animated
{
   
  //  [self doneBarButton];
    [self updateCrseBackground];
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
}



@end
