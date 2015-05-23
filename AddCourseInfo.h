//
//  AddCourseInfo.h
//  TimeTable
//
//  Created by moeen ahmad on 5/15/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DatePickerViewController.h"
#import "ViewController.h"


///declare delagate methods

@class AddCourseInfo;
@class CourseStore;

/// We pass the creted information to checkviewcontroller using delegate method.
@protocol AddItemViewControllerDelegate <NSObject>

///This method declares when user tap on the cancel button, it will dismiss the additem view controller presenting without saving the data
- (void)addItemViewControllerDidCancel:(AddCourseInfo *)controller;



///This method pass the relevant "added" information such as task, notes, whether to remind to checklistview controller
- (void)addItemViewController:(AddCourseInfo *)controller didFinishAddingItem:(CourseStore *)item;




///This method pass the relevant "edited" information such as task, notes, whether to remind to checklistview controller
- (void)addItemViewController:(AddCourseInfo *)controller didFinishEditingItem:(CourseStore *)item;
@end


@interface AddCourseInfo : UITableViewController <UITextFieldDelegate, DatePickerViewControllerDelegate, ViewControllerDelegate>


/// textField is a field where user key in the task information.



@property (weak, nonatomic) IBOutlet UITextField *CourseNameTextField;




/// notesField is a field where user key in the additional information.
@property (strong, nonatomic) IBOutlet UILabel *CrseColor;

/// We create doneBarButton as IBOutlet so that we can disable the done button if the text field is empty.
@property (nonatomic, strong) IBOutlet UIBarButtonItem *doneBarButton;

///confirms delegate method
@property (nonatomic, weak) id <AddItemViewControllerDelegate> delegate;

///We declare itemtoedit method to display information for user to edit
@property (nonatomic, strong) CourseStore *itemToEdit;


///we need a switch control for user to toggle whether notification is required
@property (nonatomic, strong) IBOutlet UISwitch *switchControl;

///this is the notification time which user selects
@property (nonatomic, strong) IBOutlet UILabel *dueDateLabel;


///create IBActions

///We create cancel IBAction. when user tap on cancel button, we dismiss the presenting view controller by calling AddItemViewControllerDelegate using delegate method
- (IBAction)cancel;

///We create done IBAction. when user tap done button, we dismiss the presenting view controller by calling didFinishAddingItem using delegate method which will pass the added/edited information to checklistviewcontroller
- (IBAction)done;

///We record when the user change the switch
- (IBAction)switchChanged:(UISwitch *)sender;





@end
