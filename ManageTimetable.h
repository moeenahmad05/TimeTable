//
//  ManageTimetable.h
//  TimeTable
//
//  Created by moeen ahmad on 5/17/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubjectStore.h"
#import "ChosseClass.h"
#import "ClassSubjectPicker.h"
#import "ViewController.h"

@class ManageTimetable;
@protocol ManageTimeTableDelegate <NSObject>

- (void)ManageTimeTableDidCancel:(ManageTimetable *)controller;

///This method pass the relevant "added" information such as task, notes, whether to remind to checklistview controller
- (void)addItemViewController1:(ManageTimetable *)controller didFinishAddingItem:(SubjectStore *)item;




///This method pass the relevant "edited" information such as task, notes, whether to remind to checklistview controller
- (void)addItemViewController2:(ManageTimetable *)controller didFinishEditingItem:(SubjectStore *)item;

@end

@interface ManageTimetable : UIViewController<ClassPickerDelegate,SUbjectPickerDelegate,ViewControllerDelegate>


@property (nonatomic, weak) id <ManageTimeTableDelegate> delegate;

@property (nonatomic, strong) SubjectStore *itemToEdit;
@property (weak, nonatomic) IBOutlet UILabel *subjctname;
@property (weak, nonatomic) IBOutlet UILabel *classno;
@property (weak, nonatomic) IBOutlet UILabel *colorlabel;

- (IBAction)cancel;
- (IBAction)done;
@end
