//
//  Time Table.m
//  TimeTable
//
//  Created by moeen ahmad on 5/13/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import "Time Table.h"
#import "SubjectStore.h"
#import "CourseStore.h"
#import <QuartzCore/QuartzCore.h>

@interface Time_Table ()

@end

@implementation Time_Table
{
    NSMutableArray *sub;
    NSMutableArray *faculty;
    NSMutableArray *clas;
    
    BOOL ShouldAutoRotate;
}
@synthesize s1to8,sun,mon,tue,wed,thu,fri,sat;
- (void)viewDidLoad {
    [super viewDidLoad];
   
    ShouldAutoRotate = NO;
    _datelabel.clipsToBounds = YES;
    self.datelabel.layer.cornerRadius = 20;
    

        
    
    

    
    
    [self dayassignment];
        
    [self classAssignment];
    
    [self SetRadius];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)SetRadius
{
        _c1.clipsToBounds = YES;
    self.c1.layer.cornerRadius = 8;
    _c2.clipsToBounds = YES;
    self.c2.layer.cornerRadius = 8;
    _c3.clipsToBounds = YES;
    self.c3.layer.cornerRadius = 8;
    _c4.clipsToBounds = YES;
    self.c4.layer.cornerRadius = 8;
    _c5.clipsToBounds = YES;
    self.c5.layer.cornerRadius = 8;
    _c6.clipsToBounds = YES;
    self.c6.layer.cornerRadius = 8;
    _c7.clipsToBounds = YES;
    self.c7.layer.cornerRadius = 8;
    _c8.clipsToBounds = YES;
    self.c8.layer.cornerRadius = 8;
    
    mon.clipsToBounds = YES;
    self.mon.layer.cornerRadius = 8;
    sun.clipsToBounds = YES;
    self.sun.layer.cornerRadius = 8;
    tue.clipsToBounds = YES;
    self.tue.layer.cornerRadius = 8;
    wed.clipsToBounds = YES;
    self.wed.layer.cornerRadius = 8;
    thu.clipsToBounds = YES;
    self.thu.layer.cornerRadius = 8;
    fri.clipsToBounds = YES;
    self.fri.layer.cornerRadius = 8;
    sat.clipsToBounds = YES;
    self.sat.layer.cornerRadius = 8;
    
    _s1.clipsToBounds = YES;
    self.s1.layer.cornerRadius = 8;
    _s2.clipsToBounds = YES;
    self.s2.layer.cornerRadius = 8;
    _s3.clipsToBounds = YES;
    self.s3.layer.cornerRadius = 8;
    _s4.clipsToBounds = YES;
    self.s4.layer.cornerRadius = 8;
    _s5.clipsToBounds = YES;
    self.s5.layer.cornerRadius = 8;
    _s6.clipsToBounds = YES;
    self.s6.layer.cornerRadius = 8;
    _s7.clipsToBounds = YES;
    self.s7.layer.cornerRadius = 8;
    _s8.clipsToBounds = YES;
    self.s8.layer.cornerRadius = 8;
    
    _m1.clipsToBounds = YES;
    self.m1.layer.cornerRadius = 8;
    _m2.clipsToBounds = YES;
    self.m2.layer.cornerRadius = 8;
    _m3.clipsToBounds = YES;
    self.m3.layer.cornerRadius = 8;
    _m4.clipsToBounds = YES;
    self.m4.layer.cornerRadius = 8;
    _m5.clipsToBounds = YES;
    self.m5.layer.cornerRadius = 8;
    _m6.clipsToBounds = YES;
    self.m6.layer.cornerRadius = 8;
    _m7.clipsToBounds = YES;
    self.m7.layer.cornerRadius = 8;
    _m8.clipsToBounds = YES;
    self.m8.layer.cornerRadius = 8;
    
    
    _t1.clipsToBounds = YES;
    self.t1.layer.cornerRadius = 8;
    _t2.clipsToBounds = YES;
    self.t2.layer.cornerRadius = 8;
    _t3.clipsToBounds = YES;
    self.t3.layer.cornerRadius = 8;
    _t4.clipsToBounds = YES;
    self.t4.layer.cornerRadius = 8;
    _t5.clipsToBounds = YES;
    self.t5.layer.cornerRadius = 8;
    _t6.clipsToBounds = YES;
    self.t6.layer.cornerRadius = 8;
    _t7.clipsToBounds = YES;
    self.t7.layer.cornerRadius = 8;
    _t8.clipsToBounds = YES;
    self.t8.layer.cornerRadius = 8;
    
    _w1.clipsToBounds = YES;
    self.w1.layer.cornerRadius = 8;
    _w2.clipsToBounds = YES;
    self.w2.layer.cornerRadius = 8;
    _w3.clipsToBounds = YES;
    self.w3.layer.cornerRadius = 8;
    _w4.clipsToBounds = YES;
    self.w4.layer.cornerRadius = 8;
    _w5.clipsToBounds = YES;
    self.w5.layer.cornerRadius = 8;
    _w6.clipsToBounds = YES;
    self.w6.layer.cornerRadius = 8;
    _w7.clipsToBounds = YES;
    self.w7.layer.cornerRadius = 8;
    _w8.clipsToBounds = YES;
    self.w8.layer.cornerRadius = 8;
    
    
    _th1.clipsToBounds = YES;
    self.th1.layer.cornerRadius = 8;
    _th2.clipsToBounds = YES;
    self.th2.layer.cornerRadius = 8;
    _th3.clipsToBounds = YES;
    self.th3.layer.cornerRadius = 8;
    _th4.clipsToBounds = YES;
    self.th4.layer.cornerRadius = 8;
    _th5.clipsToBounds = YES;
    self.th5.layer.cornerRadius = 8;
    _th6.clipsToBounds = YES;
    self.th6.layer.cornerRadius = 8;
    _th7.clipsToBounds = YES;
    self.th7.layer.cornerRadius = 8;
    _th8.clipsToBounds = YES;
    self.th8.layer.cornerRadius = 8;
    
  
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
       NSDate *mydate = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    self.datelabel.text = [formatter stringFromDate:mydate];
   
    [self classAssignment];

    
    [self classAssignment];
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
    [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
}


///assign days

-(void)dayassignment
{
    sun.text = @"Sunday";
    mon.text = @"Monday";
    tue.text = @"Tuesday";
    wed.text = @"Wednesday";
    thu.text = @"Thursday";
    fri.text = @"Friday";
    sat.text = @"Saturday";

}
-(void)classAssignment
{
    
    [self loadChecklistItems];
    
    
    
    [self dayassignment];
    
    
    SubjectStore *data;
 
    int j = (int) sub.count;
    
     CourseStore *data1;
     int k = (int) clas.count;
    
    NSLog(@"%d",k);
    for (int i = 0 ; i < j; i++) {
        data = [sub objectAtIndex:i];
    
        
        if ([sun.text isEqualToString:data.priorityToDisplay] )
        {
            if ([_c1.text isEqualToString:data.ClassToDisplay])
            {
                NSLog(@"%@",data.text);
                NSLog(@"%@",data1.coursename);
                self.s1.text = data.text;
                _s1.textAlignment = NSTextAlignmentCenter;
                _s1.backgroundColor = [UIColor cyanColor];
                
                               for (int l = 0 ; l<k; l++)
                               {
                                   data1 = [clas objectAtIndex:l];
                                  // NSLog(@"%@",data1.coursename);
                                   NSLog(@"%@",data.text);
                                   if  ([data1.coursename isEqualToString:data.text])
                                   {
                                       NSData *data = data1.coursecolor;
                                       
                                     UIColor  *recent = (UIColor *)[NSKeyedUnarchiver unarchiveObjectWithData:data];
                                       self.s1.backgroundColor = recent;
                                       NSLog(@"color");
                                   }
                               }
               
                 
                 
                 
            }
            else if ([_c2.text isEqualToString:data.ClassToDisplay])
            {
                self.s2.text = data.text;
                self.s2.backgroundColor = [UIColor greenColor];
                _s2.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c3.text isEqualToString:data.ClassToDisplay])
            {
                self.s3.text = data.text;
                self.s3.backgroundColor = [UIColor greenColor];
                _s3.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c4.text isEqualToString:data.ClassToDisplay])
            {
                self.s4.text = data.text;
                self.s4.backgroundColor = [UIColor greenColor];
                _s4.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c5.text isEqualToString:data.ClassToDisplay])
            {
                self.s5.text = data.text;
                self.s5.backgroundColor = [UIColor greenColor];
                _s5.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c6.text isEqualToString:data.ClassToDisplay])
            {
                self.s6.text = data.text;
                self.s6.backgroundColor = [UIColor greenColor];
                _s6.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c7.text isEqualToString:data.ClassToDisplay])
            {
                self.s7.text = data.text;
                self.s7.backgroundColor = [UIColor greenColor];
                _s7.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c8.text isEqualToString:data.ClassToDisplay])
            {
                self.s8.text = data.text;
                self.s8.backgroundColor = [UIColor greenColor];
                _s8.textAlignment = NSTextAlignmentCenter;
                
            }
            
        }
        
        
        else if([mon.text isEqualToString:data.priorityToDisplay] )
        {
            if ([_c1.text isEqualToString:data.ClassToDisplay])
            {
                self.m1.text = data.text;
                self.m1.backgroundColor = [UIColor redColor];
                _m1.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c2.text isEqualToString:data.ClassToDisplay])
            {
                self.m2.text = data.text;
                self.m2.backgroundColor = [UIColor redColor];
                _m2.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c3.text isEqualToString:data.ClassToDisplay])
            {
                self.m3.text = data.text;
                self.m3.backgroundColor = [UIColor redColor];
                _m3.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c4.text isEqualToString:data.ClassToDisplay])
            {
                self.m4.text = data.text;
                self.m4.backgroundColor = [UIColor redColor];
                _m4.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c5.text isEqualToString:data.ClassToDisplay])
            {
                self.m5.text = data.text;
                self.m5.backgroundColor = [UIColor redColor];
                _m5.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c6.text isEqualToString:data.ClassToDisplay])
            {
                self.m6.text = data.text;
                self.m6.backgroundColor = [UIColor redColor];
                _m6.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c7.text isEqualToString:data.ClassToDisplay])
            {
                self.m7.text = data.text;
                self.m7.backgroundColor = [UIColor redColor];
                _m7.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c8.text isEqualToString:data.ClassToDisplay])
            {
                self.m8.text = data.text;
                self.m8.backgroundColor = [UIColor redColor];
                _m8.textAlignment = NSTextAlignmentCenter;
                
            }
            
        }
        else if([tue.text isEqualToString:data.priorityToDisplay] )
        {
            
            if ([_c1.text isEqualToString:data.ClassToDisplay])
            {
                self.t1.text = data.text;
                self.t1.backgroundColor = [UIColor blueColor];
                _t1.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c2.text isEqualToString:data.ClassToDisplay])
            {
                self.t2.text = data.text;
                self.t2.backgroundColor = [UIColor blueColor];
                _t2.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c3.text isEqualToString:data.ClassToDisplay])
            {
                self.t3.text = data.text;
                self.t3.backgroundColor = [UIColor blueColor];
                _t3.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c4.text isEqualToString:data.ClassToDisplay])
            {
                self.t4.text = data.text;
                self.t4.backgroundColor = [UIColor blueColor];
                _t4.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c5.text isEqualToString:data.ClassToDisplay])
            {
                self.t5.text = data.text;
                self.t5.backgroundColor = [UIColor blueColor];
                _t5.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c6.text isEqualToString:data.ClassToDisplay])
            {
                self.t6.text = data.text;
                self.t6.backgroundColor = [UIColor blueColor];
                _t6.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c7.text isEqualToString:data.ClassToDisplay])
            {
                self.t7.text = data.text;
                self.t7.backgroundColor = [UIColor blueColor];
                _t7.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c8.text isEqualToString:data.ClassToDisplay])
            {
                self.t8.text = data.text;
                self.t8.backgroundColor = [UIColor blueColor];
                _t8.textAlignment = NSTextAlignmentCenter;
                
            }
        }
        
        else if([wed.text isEqualToString:data.priorityToDisplay] )
        {
            if ([_c1.text isEqualToString:data.ClassToDisplay])
            {
                self.w1.text = data.text;
                self.w1.backgroundColor = [UIColor brownColor];
                _w1.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c2.text isEqualToString:data.ClassToDisplay])
            {
                self.w2.text = data.text;
                self.w2.backgroundColor = [UIColor brownColor];
                _w2.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c3.text isEqualToString:data.ClassToDisplay])
            {
                self.w3.text = data.text;
                self.w3.backgroundColor = [UIColor brownColor];
                _w3.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c4.text isEqualToString:data.ClassToDisplay])
            {
                self.w4.text = data.text;
                self.w4.backgroundColor = [UIColor brownColor];
                _w4.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c5.text isEqualToString:data.ClassToDisplay])
            {
                self.w5.text = data.text;
                self.w5.backgroundColor = [UIColor brownColor];
                _w5.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c6.text isEqualToString:data.ClassToDisplay])
            {
                self.w6.text = data.text;
                self.w6.backgroundColor = [UIColor brownColor];
                _w6.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c7.text isEqualToString:data.ClassToDisplay])
            {
                self.w7.text = data.text;
                self.w7.backgroundColor = [UIColor brownColor];
                _w7.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c8.text isEqualToString:data.ClassToDisplay])
            {
                self.w8.text = data.text;
                self.w8.backgroundColor = [UIColor brownColor];
                _w8.textAlignment = NSTextAlignmentCenter;
                
            }
        }
        else if([thu.text isEqualToString:data.priorityToDisplay] )
        {
            
            if ([_c1.text isEqualToString:data.ClassToDisplay])
            {
                self.th1.text = data.text;
                self.th1.backgroundColor = [UIColor blueColor];
                _th1.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c2.text isEqualToString:data.ClassToDisplay])
            {
                self.th2.text = data.text;
                self.th2.backgroundColor = [UIColor blueColor];
                _th2.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c3.text isEqualToString:data.ClassToDisplay])
            {
                self.th3.text = data.text;
                self.th3.backgroundColor = [UIColor blueColor];
                _th3.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c4.text isEqualToString:data.ClassToDisplay])
            {
                self.th4.text = data.text;
                self.th4.backgroundColor = [UIColor blueColor];
                _th4.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c5.text isEqualToString:data.ClassToDisplay])
            {
                self.th5.text = data.text;
                self.th5.backgroundColor = [UIColor redColor];
                _th5.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c6.text isEqualToString:data.ClassToDisplay])
            {
                self.th6.text = data.text;
                self.th6.backgroundColor = [UIColor redColor];
                _th6.textAlignment = NSTextAlignmentCenter;
                
            }
            else if ([_c7.text isEqualToString:data.ClassToDisplay])
            {
                self.th7.text = data.text;
                self.th7.backgroundColor = [UIColor redColor];
                _th7.textAlignment = NSTextAlignmentCenter;
            }
            else if ([_c8.text isEqualToString:data.ClassToDisplay])
            {
                self.th8.text = data.text;
                self.th8.backgroundColor = [UIColor redColor];
                _th8.textAlignment = NSTextAlignmentCenter;
                
            }
        }
        else if([fri.text isEqualToString:data.priorityToDisplay] )
        {
            NSLog(@"not matched");
            self.f1.text = data.text;
        }
        else if([sat.text isEqualToString:data.priorityToDisplay] )
        {
            NSLog(@"not matched");
            self.st1.text = data.text;
        }
        
    }
}

//Delegate methods

- (void)ManageTimeTableDidCancel:(ManageTimetable *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
// save add content

- (void)addItemViewController1:(ManageTimetable *)controller didFinishAddingItem:(SubjectStore *)item
{
 
    [self dismissViewControllerAnimated:YES completion:nil];
    
   
    
}

//save edited content

- (void)addItemViewController2:(ManageTimetable *)controller didFinishEditingItem:(SubjectStore *)item
{
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
    
}

- (void)addItemViewControllerDidCancel:(AddSubjectItem *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


///Save the added item and dismiss view controller presented

- (void)addItemViewController:(AddSubjectItem *)controller didFinishAddingItem:(SubjectStore *)item
{
   // int newRowIndex = (int)[sub count];
    [sub addObject:item];
    [sub insertObject:item atIndex:0];
    [self saveChecklistItems];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //  [self.tableView reloadData];
    
}


- (void)addItemViewController:(AddSubjectItem *)controller didFinishEditingItem:(SubjectStore *)item
{
    [sub addObject:item];
    [sub insertObject:item atIndex:0];
    [self saveChecklistItems];
    [self dismissViewControllerAnimated:YES completion:nil];
}


//segue for connectivity

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"AddItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddSubjectItem *controller = (AddSubjectItem *)navigationController.topViewController;
        controller.delegate = self;
    }else if ([segue.identifier isEqualToString:@"EditItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddSubjectItem *controller = (AddSubjectItem *)navigationController.topViewController;
        controller.delegate = self;
        controller.itemToEdit = sender;
    }
    
    
    
  /*
     if ([segue.identifier isEqualToString:@"AddItem"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
       ManageTimetable *controller = (ManageTimetable *)navigationController.topViewController;
        controller.delegate = self;
    }
    else if ([segue.identifier isEqualToString:@"EditItem"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        ManageTimetable *controller = (ManageTimetable *)navigationController.topViewController;
        controller.delegate = self;
        controller.itemToEdit = sender;
    }
   */
}
//..............................for subject data.......


- (id)initWithCoder:(NSCoder *)aDecoder
{
    [self copyFile];
    [self copyFile1];
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self loadChecklistItems];
        
        return self;
    }
   else if ((self = [super initWithCoder:aDecoder])) {
        [self loadChecklistItems1];
        
        return self;
    }
    return self;
}


- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}
- (void)saveChecklistItems
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:sub forKey:@"LecturerItems"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}
- (NSString *)dataFilePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"LecturerItems.plist"];
}

-(void)copyFile
{
    NSString *path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSString *sourcePath=[[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:@"LecturerItems.plist"];
        NSError *error;
        [[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:path error:&error];
    }
}



///we load decoded data to tableview
- (void)loadChecklistItems
{
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        sub = [unarchiver decodeObjectForKey:@"LecturerItems"];
        [unarchiver finishDecoding];
    }
    else
    {
        sub = [[NSMutableArray alloc] initWithCapacity:20];
    }
}


////............... data for class name ........


- (NSString *)documentsDirectory1
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

///Returns a new string made by appending to the receiver a given string. Note that this method only works with file paths (not, for example, string representations of URLs).
///we save the plist in the documents director of our application

- (NSString *)dataFilePath1
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"CourseItems.plist"];
}





-(void)copyFile1
{
    NSString *path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSString *sourcePath=[[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:@"CourseItems.plist"];
        NSError *error;
        [[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:path error:&error];
    }
}



- (void)loadChecklistItems1
{
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        clas = [unarchiver decodeObjectForKey:@"CourseItems"];
        [unarchiver finishDecoding];
    }
    else
    {
        clas = [[NSMutableArray alloc] initWithCapacity:30];
    }
}




- (IBAction)Actionbutton:(id)sender {
    
   
            
        //  [self performSegueWithIdentifier:@"AddItem" sender:nil];
   
     

}
-(void)popup
{
         UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Edit Selected Field" message:@"Please go to the Setting page for further info and deletion of particular Classes" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
}

- (IBAction)b1:(id)sender {
 //   NSString *test;
    if ([self.s1.text length] > 0)
    {
        [self popup];
       }else
    {
         [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b2:(id)sender {
    if ([self.s2.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b3:(id)sender {
    
    if ([self.s3.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b4:(id)sender {
    if ([self.s4.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b5:(id)sender {
    
    if ([self.s5.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b6:(id)sender
{
    if ([self.s6.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}

- (IBAction)b7:(id)sender {
    
    if ([self.s7.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}

- (IBAction)b8:(id)sender {
   
    if ([self.s8.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b9:(id)sender {
    
    if ([self.m1.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
}
- (IBAction)b10:(id)sender {
    if ([self.m2.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b11:(id)sender {
    
    if ([self.m3.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b12:(id)sender {
    
    if ([self.m4.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b13:(id)sender {
    
    if ([self.m5.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }

}
- (IBAction)b14:(id)sender {
    
    if ([self.m6.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}

- (IBAction)b15:(id)sender {
    
    if ([self.m7.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}

- (IBAction)b16:(id)sender {
    
    if ([self.m8.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
    
}
- (IBAction)b17:(id)sender {
    
    if ([self.t1.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}

- (IBAction)b18:(id)sender {
    
    if ([self.t2.text length] > 0)  {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b19:(id)sender {
    
    if ([self.t3.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b20:(id)sender {
    
    if ([self.t4.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
}
- (IBAction)b21:(id)sender {
    
    if ([self.t5.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
    
}
- (IBAction)b22:(id)sender {
    
    if ([self.t6.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b23:(id)sender {
    
    if ([self.t7.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}

- (IBAction)b24:(id)sender {
    if ([self.t8.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
}

- (IBAction)b25:(id)sender {
    
    if ([self.w1.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b26:(id)sender {
    if ([self.w2.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b27:(id)sender {
    if ([self.w3.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }

}
- (IBAction)b28:(id)sender {
    if ([self.w4.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
    
}
- (IBAction)b29:(id)sender {
    if ([self.w5.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b30:(id)sender {
    
    if ([self.w6.text length] > 0)  {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b31:(id)sender {
    
    if ([self.w7.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}

- (IBAction)b32:(id)sender {
    
    if ([self.w8.text length] > 0)  {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}

- (IBAction)b33:(id)sender {
    
    if ([self.th1.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b34:(id)sender {
    
    if ([self.th2.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
    
    
}
- (IBAction)b35:(id)sender {
    
    if ([self.f1.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
    
}
- (IBAction)b36:(id)sender {
    
    if ([self.th4.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }

}
- (IBAction)b37:(id)sender {
    if ([self.th5.text length] > 0)  {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}
- (IBAction)b38:(id)sender {
    if ([self.th6.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
    
}
- (IBAction)b39:(id)sender {
    
    if ([self.th7.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}

- (IBAction)b40:(id)sender {
    
    if ([self.th8.text length] > 0)   {
        [self popup];
    }else
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
    }
}

- (IBAction)b41:(id)sender {
    
    if ([self.f1.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
    
}

- (IBAction)b42:(id)sender {
    
    if ([self.f2.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }

}
- (IBAction)b43:(id)sender {
    
    if ([self.f3.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
}
- (IBAction)b44:(id)sender {
    
    if ([self.f4.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
}
- (IBAction)b45:(id)sender {
    
    if ([self.f5.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
    
    

}
- (IBAction)b46:(id)sender {
    
    
    
    if ([self.f6.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
    
    
    
}
- (IBAction)b47:(id)sender {
    
    
    if ([self.f7.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
    
}

- (IBAction)b48:(id)sender {
    
    
    if ([self.f8.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
    
    
    
}

- (IBAction)b49:(id)sender {
    
    
    if ([self.st1.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
}

- (IBAction)b50:(id)sender {
    
    
    if ([self.st2.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
    
}
- (IBAction)b51:(id)sender {
    
    if ([self.st3.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
    
    
}
- (IBAction)b52:(id)sender {
    
    
    if ([self.st4.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
    
}
- (IBAction)b53:(id)sender {
    
    if ([self.st5.text length] > 0)
    {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
    
    
    
}
- (IBAction)b54:(id)sender {
    
    
    if ([self.st6.text length] > 0) {
        [self performSegueWithIdentifier:@"AddItem" sender:nil];
        
    }else
    {
        NSLog(@"%@",_s1.text);
    }
    
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    self.s1.text = @"";
    self.s2.text = @"";
    self.s3.text = nil;
    self.s4.text = nil;
    self.s5.text = nil;
    self.s6.text = nil;
    self.s7.text = nil;
    self.s8.text = nil;
    
    
    self.m1.text = nil;
    self.m2.text = nil;
    self.m3.text = nil;
    self.m4.text = nil;
    self.m5.text = nil;
    self.m6.text = nil;
    self.m7.text = nil;
    self.m8.text = nil;
    
    
    self.t1.text = nil;
    self.t2.text = nil;
    self.t3.text = nil;
    self.t4.text = nil;
    self.t5.text = nil;
    self.t6.text = nil;
    self.t7.text = nil;
    self.t8.text = nil;
    
    
    self.w1.text = nil;
    self.w2.text = nil;
    self.w3.text = nil;
    self.w4.text = nil;
    self.w5.text = nil;
    self.w7.text = nil;
    self.w8.text = nil;
    self.w6.text = nil;
    
    self.th1.text = nil;
    self.th2.text = nil;
    self.th3.text = nil;
    self.th4.text = nil;
    self.th5.text = nil;
    self.th6.text = nil;
    self.th7.text = nil;
    self.th8.text = nil;

    self.f2.text = nil;
    self.f3.text = nil;
    self.f4.text = nil;
    self.f5.text = nil;
    self.f6.text = nil;
    self.f7.text = nil;
    self.f8.text = nil;
    self.f1.text = nil;
    
    self.s1.backgroundColor = [UIColor clearColor];
     self.s2.backgroundColor = [UIColor clearColor];
     self.s3.backgroundColor = [UIColor clearColor];
     self.s8.backgroundColor = [UIColor clearColor];
     self.s4.backgroundColor = [UIColor clearColor];
    self.s5.backgroundColor = [UIColor clearColor];
    self.s6.backgroundColor = [UIColor clearColor];
    self.s7.backgroundColor = [UIColor clearColor];
    
    self.m1.backgroundColor = [UIColor clearColor];
    self.m2.backgroundColor = [UIColor clearColor];
    self.m3.backgroundColor = [UIColor clearColor];
    self.m8.backgroundColor = [UIColor clearColor];
    self.m4.backgroundColor = [UIColor clearColor];
    self.m5.backgroundColor = [UIColor clearColor];
    self.m6.backgroundColor = [UIColor clearColor];
    self.m7.backgroundColor = [UIColor clearColor];
    
    self.t1.backgroundColor = [UIColor clearColor];
    self.t2.backgroundColor = [UIColor clearColor];
    self.t3.backgroundColor = [UIColor clearColor];
    self.t8.backgroundColor = [UIColor clearColor];
    self.t4.backgroundColor = [UIColor clearColor];
    self.t5.backgroundColor = [UIColor clearColor];
    self.t6.backgroundColor = [UIColor clearColor];
    self.t7.backgroundColor = [UIColor clearColor];
    
    self.w1.backgroundColor = [UIColor clearColor];
    self.w2.backgroundColor = [UIColor clearColor];
    self.w3.backgroundColor = [UIColor clearColor];
    self.w8.backgroundColor = [UIColor clearColor];
    self.w4.backgroundColor = [UIColor clearColor];
    self.w5.backgroundColor = [UIColor clearColor];
    self.w6.backgroundColor = [UIColor clearColor];
    
    
    self.w7.backgroundColor = [UIColor clearColor];
    
    self.th1.backgroundColor = [UIColor clearColor];
    self.th2.backgroundColor = [UIColor clearColor];
    self.th3.backgroundColor = [UIColor clearColor];
    self.th8.backgroundColor = [UIColor clearColor];
    self.th4.backgroundColor = [UIColor clearColor];
    self.th5.backgroundColor = [UIColor clearColor];
    self.th6.backgroundColor = [UIColor clearColor];
    self.th7.backgroundColor = [UIColor clearColor];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    // Return YES for supported orientations
  
    
    return ShouldAutoRotate;
    
}

-(NSUInteger)supportedInterfaceOrientations {
    
    if (ShouldAutoRotate)
        return UIInterfaceOrientationMaskAll;
    else
        return UIInterfaceOrientationMaskLandscape;
    
}
@end
