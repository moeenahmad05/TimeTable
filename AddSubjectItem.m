//
//  AddSubjectItem.m
//  TimeTable
//
//  Created by moeen ahmad on 5/15/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import "AddSubjectItem.h"
#import "SubjectStore.h"
@interface AddSubjectItem ()

@end

@implementation AddSubjectItem{
    NSString *text;
    NSString *priority;
    NSString *priorityToDisplay;
   
    NSString *clstoDisplay;
   
}
///synthesize properties

@synthesize textField,doneBarButton;
@synthesize delegate;
@synthesize itemToEdit;
@synthesize priorityLabel, priorityLabelToDisplay,classLabelToDisplay;

///we display current date and time when we present the additemvewcontroller to user
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        text = @"";
        
       
    }
    return self;
}





///we enable done bar button only when text field length is more than one character.
- (void)updateDoneBarButton
{
    self.doneBarButton.enabled = ([text length] > 0);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    
    /// custom background view with our own image
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"I1.png"]];
    
    
    
    ///we check whether it is editing mode or adding mode, then set the title and fields appropriately.
    
    if (self.itemToEdit != nil) {
        self.title = @"Edit Course & Timing";
        
    } else
        
        self.title = @"Add Course & Timing";
    self.textField.text = text;
   
    
    self.classLabelToDisplay.text = clstoDisplay;
    self.priorityLabel.text = priority;
    self.priorityLabelToDisplay.text = priorityToDisplay;
  //  [self updateDoneBarButton];
    [self updatecouselabel];
    [self updateClassLabel];
   
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor whiteColor];
    
    // if you have index/header text in your tableview change your index text color
    UITableViewHeaderFooterView *headerIndexText = (UITableViewHeaderFooterView *)view;
    [headerIndexText.textLabel setTextColor:[UIColor whiteColor]];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
  
        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
        [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
    
    if (self.title != NSLocalizedString(@"Edit Course & Timing", nil))
    {
        [self.textField becomeFirstResponder];
        //  [self updatecouselabel];
        [self updateDoneBarButton];
        
    }
    else
    {
        [self.textField resignFirstResponder];
    }
}





/// method to call addItemViewControllerDidCancel method when cancel button pressed

- (IBAction)cancel
{
    [self.delegate addItemViewControllerDidCancel:self];
}


/// method to call didFinishAddingItem method when Done button pressed


- (IBAction)done
{
      if(([textField.text length] > 0)&& ([priorityLabelToDisplay.text length]> 0)&&([classLabelToDisplay.text length]> 0) )
      {
          
          
             if (self.itemToEdit == nil)
    {
        SubjectStore *item = [[SubjectStore alloc] init];
        item.text = self.textField.text;
   
        item.ClassToDisplay = self.classLabelToDisplay.text;
        item.priority = self.priorityLabel.text;
        item.priorityToDisplay = self.priorityLabelToDisplay.text;
        item.checked = NO;
        [self.delegate addItemViewController:self didFinishAddingItem:item];
    } else
    {
        self.itemToEdit.text = self.textField.text;
      
        self.itemToEdit.ClassToDisplay = self.classLabelToDisplay.text;
        self.itemToEdit.priority = self.priorityLabel.text;
        self.itemToEdit.priorityToDisplay = self.priorityLabelToDisplay.text;
       
        [self.delegate addItemViewController:self didFinishEditingItem:self.itemToEdit];
    }
      }
      else{
          UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please Pick all field in order to proceed" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
          
          [alert show];
          
      }
    
    
    
 
}







///optionally we can dismiss keyboard if the user starts to scroll the tableview

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.textField resignFirstResponder];
    
}




///to prevent the uitableview cell turns blue when user taps on it

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((indexPath.section == 0 && indexPath.row == 0 ) )
    {
        [self performSegueWithIdentifier:@"ChooseCourse" sender:self];
    }
    if ((indexPath.section == 1 && indexPath.row == 1 ) )
    {
        [self performSegueWithIdentifier:@"ChooseTime" sender:self];
    }
   if (indexPath.row == 1)
    {
        return indexPath;
    } else
    {
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
    [self setTextField:nil];
    
    [self setDoneBarButton:nil];
 

    [self setClassLabelToDisplay:nil];
    
    [self setPriorityLabel:nil];
    [self setPriorityLabelToDisplay:nil];
    [super viewDidUnload];
}


///we present stored item if the user editing an item

- (void)setItemToEdit:(SubjectStore*)newItem
{
    if (itemToEdit != newItem) {
        itemToEdit = newItem;
        
        text = itemToEdit.text;
        priority = itemToEdit.priority;
        priorityToDisplay = itemToEdit.priorityToDisplay;
        
        
        clstoDisplay = itemToEdit.ClassToDisplay;
        
         }
}






///we use prepare for segue method to display date picker controller

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
    
    if ([segue.identifier isEqualToString:@"ChooseTime"]) {
        
        
        ChosseClass *controller2 = segue.destinationViewController;
        
        controller2.delegate = self;
        
        controller2.subject.text =priorityLabelToDisplay.text;
        NSLog(@"%@",controller2.classAndSubject.text);
        
        [self updateClassLabel];
        NSLog(@"%@",priorityLabelToDisplay.text);
    }
    
    if ([segue.identifier isEqualToString:@"ChooseCourse"]) {
        
        
        ClassSubjectPicker *controller3 = segue.destinationViewController;
        
        controller3.delegate = self;
        
        controller3.subject.text =textField.text;
        NSLog(@"%@",controller3.classAndSubject.text);
        
        [self updatecouselabel];
        NSLog(@"%@",textField.text);
    }
    
    
}






-(void)updatecouselabel
{
    self.textField.text = text;
}

-(void)updateClassLabel
{
    self.classLabelToDisplay.text = clstoDisplay;
    NSLog(@"%@",classLabelToDisplay.text);
}
-(void)ClassPick:(ChosseClass *)picker didPickClass:(NSString *)subjectclass
{
     clstoDisplay = subjectclass;
    NSLog(@"%@",clstoDisplay);
    [self updateClassLabel];
     [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)ClasspickerDidCancel:(ChosseClass *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)SubjectPick:(ClassSubjectPicker *)picker didPickSubject:(NSString *)subject
{
    text = subject;
    NSLog(@"%@",text);
  [self updatecouselabel];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)SubjectpickerDidCancel:(ClassSubjectPicker *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

///configure what to display in picker action sheet when the user tap on priority label

- (IBAction)priority:(id)sender
{
    
    
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Select Days" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"None",
                            @"Sunday",
                            @"Monday",
                            @"Tuesday",
                            @"Wednesday",
                            @"Thursday",                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
    
    
}



///we update the priority labels according user to user selection in picker list


- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    self.priorityLabelToDisplay.text = @"None";
                    
                    self.priorityLabel.text = @"";
                    
                    break;
                case 1:
                    
                    self.priorityLabelToDisplay.text = @"Sunday";
                    
                    self.priorityLabel.text = @"!";
                    
                    break;
                case 2:
                    
                    self.priorityLabelToDisplay.text = @"Monday";
                    
                    self.priorityLabel.text = @"!!";
                    
                    
                    break;
                case 3:
                    
                    self.priorityLabelToDisplay.text = @"Tuesday";
                    
                    self.priorityLabel.text = @"!!!";
                    
                    break;
                case 4:
                    
                    self.priorityLabelToDisplay.text = @"Wednesday";
                    
                    self.priorityLabel.text = @"!!!";
                    
                    break;
                    
                case 5:
                    
                    self.priorityLabelToDisplay.text = @"Thursday";
                    
                    self.priorityLabel.text = @"!!!";
                    
                    break;
                    
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}


- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    for (UIView *subview in actionSheet.subviews) {
        if ([subview isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)subview;
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
    }
}





@end
