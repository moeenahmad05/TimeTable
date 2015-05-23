//
//  ChosseClass.h
//  TimeTable
//
//  Created by moeen ahmad on 5/19/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChosseClass;

@protocol ClassPickerDelegate <NSObject>

-(void)ClasspickerDidCancel:(ChosseClass *)picker;

- (void)ClassPick:(ChosseClass*)picker didPickClass:(NSString *)subjectclass;

@end

@interface ChosseClass : UIViewController
@property (nonatomic, weak) id <ClassPickerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIPickerView *Picker;
@property (weak, nonatomic) IBOutlet UILabel *classAndSubject;
@property (nonatomic, strong) UILabel *subject;
- (IBAction)cancel;
- (IBAction)done;
-(void)subjectPicked:(NSString *)subject;

@end
