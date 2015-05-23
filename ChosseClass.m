//
//  ChosseClass.m
//  TimeTable
//
//  Created by moeen ahmad on 5/19/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import "ChosseClass.h"

@interface ChosseClass ()
{
    NSMutableArray *classtiming;
    
}

@end

@implementation ChosseClass
@synthesize Picker,classAndSubject;

- (void)viewDidLoad {
    [super viewDidLoad];
    classtiming = [[NSMutableArray alloc]initWithObjects:@"08:00 AM",@"09:00 AM",@"10:00 AM",@"11:00 AM",@"1:00 PM",@"02:00 PM",@"03:00 PM",@"04:00 PM", nil];
    
    
    
    
    
    self.subject.text = classAndSubject.text;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return classtiming.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  
    return [classtiming objectAtIndex:row];
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    classAndSubject.text = [NSString stringWithFormat:@"%@",[classtiming objectAtIndex:[Picker selectedRowInComponent:0]]];
    self.subject.text = classAndSubject.text;
}
-(void)subjectPicked:(NSString *)subject
{
    self.subject.text = classAndSubject.text;
}

-(IBAction)cancel
{
    [self.delegate ClasspickerDidCancel:self];
    
}
-(IBAction)done
{
    
    
    [self.delegate ClassPick:self didPickClass:self.classAndSubject.text ];
}


@end
