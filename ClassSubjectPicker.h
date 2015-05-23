//
//  ClassSubjectPicker.h
//  TimeTable
//
//  Created by moeen ahmad on 5/15/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClassSubjectPicker;

@protocol SUbjectPickerDelegate <NSObject>

-(void)SubjectpickerDidCancel:(ClassSubjectPicker *)picker;


- (void)SubjectPick:(ClassSubjectPicker*)picker didPickSubject:(NSString *)subject;

@end


@interface ClassSubjectPicker : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic, weak) id <SUbjectPickerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIPickerView *Picker;
@property (weak, nonatomic) IBOutlet UILabel *classAndSubject;
@property (nonatomic, strong) UILabel *subject;
- (IBAction)cancel;
- (IBAction)done;
-(void)subjectPicked:(NSString *)subject;

@end
