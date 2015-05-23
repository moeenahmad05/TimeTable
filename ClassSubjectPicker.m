//
//  ClassSubjectPicker.m
//  TimeTable
//
//  Created by moeen ahmad on 5/15/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import "ClassSubjectPicker.h"

#import "CourseStore.h"

@interface ClassSubjectPicker ()
{
    NSMutableArray *class;
    NSMutableArray *data1;
}

@end

@implementation ClassSubjectPicker

@synthesize Picker,classAndSubject;


@synthesize subject;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  // class = [[NSMutableArray alloc]initWithObjects:@"Physics",@"Chemistry",@"Geology",@"Arabi",@"English", nil];
    
    
    
    
    
   self.subject.text = classAndSubject.text;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return class.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    data1 = [[NSMutableArray alloc]init];
    CourseStore *item;
     int j = (int) class.count;
    for (int i = 0 ; i < j; i++)
    {
         item = [class objectAtIndex:i];
        NSString *add = item.coursename;
      // data1 = [[NSMutableArray alloc]initWithObjects: @" ", nil];
        
       [data1 addObject:add];
        
        NSLog(@"%@",item.coursename);
    }
    
       
    
    
    
    
    return [data1 objectAtIndex:row];
    
   
  //  return [class objectAtIndex:row];
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    classAndSubject.text = [NSString stringWithFormat:@"%@",[data1 objectAtIndex:[Picker selectedRowInComponent:0]]];
    self.subject.text = classAndSubject.text;
}
-(void)subjectPicked:(NSString *)subject
{
    self.subject.text = classAndSubject.text;
}

-(IBAction)cancel
{
 [self.delegate SubjectpickerDidCancel:self];

}
-(IBAction)done
{
    
   
    [self.delegate SubjectPick:self didPickSubject:self.classAndSubject.text ];
}

///Creates a list of path strings for the specified directories in the specified domains. The list is in the order in which you should search the directories. If expandTilde is YES, tildes are expanded as described in stringByExpandingTildeInPath.
///we define the plist shall be saved in our own directory

- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

///Returns a new string made by appending to the receiver a given string. Note that this method only works with file paths (not, for example, string representations of URLs).
///we save the plist in the documents director of our application

- (NSString *)dataFilePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"CourseItems.plist"];
}



///Method to save the data to plist

- (void)saveChecklistItems
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:class forKey:@"CourseItems"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

/*
 ///decode the plist
 - (id)initWithCoder:(NSCoder *)aDecoder
 {
 if ((self = [super initWithCoder:aDecoder])) {
 [self loadChecklistItems];
 }
 return self;
 }
 */

- (id)initWithCoder:(NSCoder *)aDecoder
{
    [self copyFile];
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self loadChecklistItems];
    }
    return self;
}


-(void)copyFile
{
    NSString *path = [self dataFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSString *sourcePath=[[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:@"CourseItems.plist"];
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
        class = [unarchiver decodeObjectForKey:@"CourseItems"];
        [unarchiver finishDecoding];
    }
    else
    {
        class = [[NSMutableArray alloc] initWithCapacity:20];
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
