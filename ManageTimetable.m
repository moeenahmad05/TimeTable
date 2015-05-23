//
//  ManageTimetable.m
//  TimeTable
//
//  Created by moeen ahmad on 5/17/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import "ManageTimetable.h"



@interface ManageTimetable ()
{
    NSString *crse;
   UIColor *colr;
    NSString *cls;
}

@end

@implementation ManageTimetable
@synthesize subjctname,classno,colorlabel,itemToEdit,delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    subjctname.text = @"Choose subject";
    classno.text = @"Choose Class";
    colorlabel.backgroundColor = [UIColor greenColor];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    
    if ([segue.identifier isEqualToString:@"ChooseClass"]) {
        
        
        ChosseClass *controller2 = segue.destinationViewController;
        
        controller2.delegate = self;
        
        controller2.subject.text =classno.text;
        NSLog(@"%@",controller2.classAndSubject.text);
        
        [self updateClassLabel];
        NSLog(@"%@",classno.text);
    }
    
    if ([segue.identifier isEqualToString:@"ChooseColor"]) {
    ViewController *controller1 = segue.destinationViewController;
    controller1.delegate = self;
    
    controller1.sampleLabel.backgroundColor = colr;
    
    [self updateCrseBackground];
}

if ([segue.identifier isEqualToString:@"ChooseSubject"]) {
    
    
    ClassSubjectPicker *controller3 = segue.destinationViewController;
    
    controller3.delegate = self;
    
    controller3.subject.text =subjctname.text;
    NSLog(@"%@",controller3.classAndSubject.text);
    
    [self updatecrselabel];
    NSLog(@"%@",subjctname.text);
}
    
}


-(void)updatecrselabel
{
    self.subjctname.text = crse;
    NSLog(@"%@",subjctname.text);
}
-(void)updateCrseBackground
{
    self.colorlabel.backgroundColor = colr;
    
}
-(void)SubjectPick:(ClassSubjectPicker *)picker didPickSubject:(NSString *)subject
{
    crse = subject;
    NSLog(@"%@",crse);
    [self updatecrselabel];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)SubjectpickerDidCancel:(ClassSubjectPicker *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)ColorPick:(ViewController *)picker didPickcolor:(UIColor *)color
{
    colr= color;
    [self updateCrseBackground];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)ColorPickerDidCancel:(ViewController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)updateClassLabel
{
    self.classno.text = cls;
    NSLog(@"%@",classno.text);
}
-(void)ClassPick:(ChosseClass *)picker didPickClass:(NSString *)subjectclass
{
    cls = subjectclass;
    NSLog(@"%@",cls);
    [self updateClassLabel];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)ClasspickerDidCancel:(ChosseClass *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}




-(IBAction)cancel
{
    [self.delegate ManageTimeTableDidCancel:self ];
}

-(IBAction)done
{
    
    
    [self.delegate addItemViewController1:self didFinishAddingItem:itemToEdit];
}


-(void)viewDidAppear:(BOOL)animated
{
    [self updateClassLabel];
    [self updatecrselabel];
    [self updateCrseBackground];
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
}



@end
