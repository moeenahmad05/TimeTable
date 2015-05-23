//
//  Home.m
//  TimeTable
//
//  Created by moeen ahmad on 5/13/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import "Home.h"
#import "SubjectStore.h"
#import "CourseStore.h"
#import "ChecklistItem.h"

@interface Home ()
{
    
    NSDate *mydate ;
}

@end

@implementation Home
{
    NSMutableArray *clas;
    NSMutableArray *sub;
    NSMutableArray *faculty;
    NSString *classtime;
}

@synthesize currentdate,tableview;
- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view.
    
    
    // nav bar style
    
    UIImage *navbar = [UIImage imageNamed:@"header4.png"];
    [[UINavigationBar appearance] setBackgroundImage:navbar forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    NSDictionary *textTitleOptions = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIColor blackColor], NSForegroundColorAttributeName, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:textTitleOptions];
    
   
    
    UIImage *tabBarBackground = [UIImage imageNamed:@"footer4.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    [[UITabBar appearance] setTintColor:[UIColor blackColor]];
    
    
  //[[UINavigationBar appearance] setBarTintColor:[UIColor lightTextColor]];
    
    //[self.tabBarController.tabBar setBackgroundColor:[UIColor clearColor]];
  // currentdate.clipsToBounds = YES;
   // self.currentdate.layer.cornerRadius = 20;
    
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
     self.tableview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"I1.png"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated
{
    [self loadChecklistItems];
     mydate = [NSDate date];
   
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    self.currentdate.text = [formatter stringFromDate:mydate];
    
    tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [tableview reloadData];
    
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{int j = (int) sub.count;
    return j;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *celidentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:celidentifier forIndexPath:indexPath];
    
    SubjectStore *data;
    
    data = [sub objectAtIndex:indexPath.row];
    
    
        cell.textLabel.text =data.text;
    
 /*
    NSDate *currentTime1 = data.dueDate;
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"hh-mm a"];
    
  */
    classtime = data.ClassToDisplay;
   /*
    NSDate *currentTime = data.endDate;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh-mm a"];
    */
        ///cell.detailTextLabel.text = data.priorityToDisplay;
   cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ at %@ ",data.priorityToDisplay ,classtime];
      
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  100;
}



//..............................for subject data.......


- (id)initWithCoder:(NSCoder *)aDecoder
{
    [self copyFile];
    [self copyFile1];
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self loadChecklistItems];
    }
    if ((self = [super initWithCoder:aDecoder])) {
        [self loadChecklistItems1];
    }
    return self;
}

- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
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



///we load decoded data to tableview
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
        clas = [[NSMutableArray alloc] initWithCapacity:20];
    }
}
@end
