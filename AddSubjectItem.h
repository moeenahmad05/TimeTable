//
//  AddSubjectItem.h
//  TimeTable
//
//  Created by moeen ahmad on 5/15/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ChosseClass.h"
#import "ClassSubjectPicker.h"
///declare delagate methods

@class AddSubjectItem;
@class SubjectStore;

/// We pass the creted information to checkviewcontroller using delegate method.
@protocol AddItemViewControllerDelegate <NSObject>

///This method declares when user tap on the cancel button, it will dismiss the additem view controller presenting without saving the data
- (void)addItemViewControllerDidCancel:(AddSubjectItem*)controller;



- (void)addItemViewController:(AddSubjectItem *)controller didFinishAddingItem:(SubjectStore *)item;





- (void)addItemViewController:(AddSubjectItem *)controller didFinishEditingItem:(SubjectStore *)item;
@end




@interface AddSubjectItem : UITableViewController<UITextFieldDelegate,UIActionSheetDelegate, ClassPickerDelegate,SUbjectPickerDelegate >



@property (weak, nonatomic) IBOutlet UILabel *textField;


@property (nonatomic, strong) IBOutlet UIBarButtonItem *doneBarButton;



///this is the notification time which user selects





@property (nonatomic, strong) IBOutlet UILabel *priorityLabel;


@property (nonatomic, strong) IBOutlet UILabel *priorityLabelToDisplay;

@property (nonatomic, strong) IBOutlet UILabel *classLabelToDisplay;

@property (nonatomic, weak) id <AddItemViewControllerDelegate> delegate;


@property (nonatomic, strong) SubjectStore *itemToEdit;




- (IBAction)cancel;

- (IBAction)done;

- (IBAction)priority:(id)sender;


@end
