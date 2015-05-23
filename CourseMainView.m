//
//  CourseMainView.m
//  TimeTable
//
//  Created by moeen ahmad on 5/15/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import "CourseMainView.h"

@interface CourseMainView ()

@end
#import "CourseStore.h"

@implementation CourseMainView{
    
    NSMutableArray *items;
    UIColor *recent;
}
@synthesize TableView;
///synthesize ilteredtabledata, searchbar and filterstatus
@synthesize filteredTableData;

@synthesize isFiltered;
- (void)viewDidLoad {
    [super viewDidLoad];
    ///initialize pull to refresh control
    
    [self.refreshControl
     addTarget:self
     action:@selector(refresh)
     forControlEvents:UIControlEventValueChanged
     ];
    
    /// configure left navigation bar button item as edit button. This edit button has a mechanism of changing its title to "Done" when it pressed
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
     TableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"I1.png"]];
    ///create add and share buttons to be right bar button of navigation controllers
    
    UIBarButtonItem *addButton         = [[UIBarButtonItem alloc]
                                          initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                          target:self
                                          action:@selector(refresh)];
    /*
     UIBarButtonItem *shareButton         = [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemAction
     target:self
     action:@selector(shareButtonClicked:)];
     
     */
    self.navigationItem.rightBarButtonItems =
    [NSArray arrayWithObjects:addButton, nil];
    
    
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
    [archiver encodeObject:items forKey:@"CourseItems"];
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
        items = [unarchiver decodeObjectForKey:@"CourseItems"];
        [unarchiver finishDecoding];
    }
    else
    {
        items = [[NSMutableArray alloc] initWithCapacity:20];
    }
}





///Tells the data source to return the number of rows in a given section of a table view. (required)
/// Number of rows in tableview. we leave it to count it itself and we don't limit it.
///we check the filter status and then count the rows accordingly

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(                                                                       NSInteger)section
{
    
    int rowCount;
    if(self.isFiltered)
        rowCount = (int)filteredTableData.count;
    else
        rowCount = (int) items.count;
    
    return rowCount;
    // return [items count];
}


///Asks the data source for a cell to insert in a particular location of the table view. (required)
/// here we configure uitableview cell. this will be reused for te whole tableview
///we supply tableview cell for search table as well


- (CustomCouseCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ChecklistItem";
    
   CustomCouseCell *cell =(CustomCouseCell*) [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //   CustomTableViewCell *cell =  [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil)
        
        cell = [[CustomCouseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    CourseStore* item;
    
    if(isFiltered)
        item = [filteredTableData objectAtIndex:indexPath.row];
    else
        item = [items objectAtIndex:indexPath.row];
    
    
    //   ChecklistItem *item = [items objectAtIndex:indexPath.row];
    
    [self configureTextForCell:cell withChecklistItem:item];
       
    
    return cell;
    
}

- (IBAction)accessoryButtonTapped:(id)sender event:(id)event
{
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint: currentTouchPosition];
    if (indexPath != nil)
        
    {
        [self tableView: self.tableView accessoryButtonTappedForRowWithIndexPath: indexPath];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



///The method allows the delegate to specify rows with varying heights. If this method is implemented, the value it returns overrides the value specified for the rowHeight property of UITableView for the given row.
/// height of uitable view cell which overrides interface builder

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}



/// following method configures uitableviewcell text when user adds a new item

- (void)configureTextForCell:(CustomCouseCell *)cell withChecklistItem:(CourseStore *)item
{
    
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.coursename;
    
 
 UILabel *notesLabel = (UILabel *)[cell viewWithTag:1500];

    recent = notesLabel.backgroundColor;
    if (item.coursecolor == nil) {
        NSLog(@"not supported");
    }
    else
    {
    NSData *data = item.coursecolor;
    
recent = (UIColor *)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    notesLabel.backgroundColor = recent;
    
    
    }
  
    if (item.shouldRemind == YES) {
        
        UILabel *dueDateLabel = (UILabel *)[cell viewWithTag:1600];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        dueDateLabel.text = [formatter stringFromDate:item.dueDate];
        
    } else
    {
        UILabel *dueDateLabel = (UILabel *)[cell viewWithTag:1600];
        dueDateLabel.text = nil;
        
    }
    
}









///The delegate handles selections in this method. One of the things it can do is exclusively assign the check-mark image (UITableViewCellAccessoryCheckmark) to one row in a section (radio-list style). This method isn’t called when the editing property of the table is set to YES (that is, the table view is in editing mode)
///when the user tap on the particular cell, we treat it as the item is completed and we call cofigurecheckmarkforcell method to display checkmark and update plist.

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    CustomCouseCell *cell = (CustomCouseCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    CourseStore* item;
    
    if(isFiltered)
    {
        item = [filteredTableData objectAtIndex:indexPath.row];
    }
    else
    {
        item = [items objectAtIndex:indexPath.row];
    }
    
    //  ChecklistItem *item = [items objectAtIndex:indexPath.row];
    [item toggleChecked];
   [self configureTextForCell:cell withChecklistItem:item];
    [self saveChecklistItems];
    
}

///A swipe motion across a cell does not cause the display of a Delete button unless the table view's data source implements the tableView:commitEditingStyle:forRowAtIndexPath: method.
///When users tap the insertion (green plus) control or Delete button associated with a UITableViewCell object in the table view, the table view sends this message to the data source, asking it to commit the change. (If the user taps the deletion (red minus) control, the table view then displays the Delete button to get confirmation.) The data source commits the insertion or deletion by invoking the UITableView methods insertRowsAtIndexPaths:withRowAnimation: or deleteRowsAtIndexPaths:withRowAnimation:, as appropriate.

///when user swip left to right or right to left, table view enters into editing mode and prepares to delete the data from table view. once user deleted, we remove that particular item from plist.

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [items removeObjectAtIndex:indexPath.row];
    [self saveChecklistItems];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
}







///The presenting view controller is responsible for dismissing the view controller it presented. If you call this method on the presented view controller itself, it automatically forwards the message to the presenting view controller.
///dismiss view controller presented

- (void)addItemViewControllerDidCancel:(AddCourseInfo *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


///Save the added item and dismiss view controller presented

- (void)addItemViewController:(AddCourseInfo *)controller didFinishAddingItem:(CourseStore *)item
{
    int newRowIndex = (int)[items count];
    [items addObject:item];
    //  [items insertObject:item atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self saveChecklistItems];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //  [self.tableView reloadData];
    
}


/// A UIStoryboardSegue object is responsible for performing the visual transition between two view controllers. In addition, segue objects are used to prepare for the transition from one view controller to another. Segue objects contain information about the view controllers involved in a transition. When a segue is triggered, but before the visual transition occurs, the storyboard runtime calls the current view controller’s prepareForSegue:sender: method so that it can pass any needed data to the view controller that is about to be displayed. The UIStoryboardSegue class supports the standard visual transitions available in UIKit. You can also subclass to define custom transitions between the view controllers in your storyboard file. You do not create segue objects directly. Instead, the storyboard runtime creates them when it must perform a segue between two view controllers. You can still initiate a segue programmatically using the performSegueWithIdentifier:sender: method of UIViewController if you want. You might do so to initiate a segue from a source that was added programmatically and therefore not available in Interface Builder.

/// When the user taps on "Add" button, "additem" segue is triggered and add new item view controller is presented. wen user tap on accessory button, "edititem" is triggered and item view controller is presented in editing mode.

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddCourseInfo *controller = (AddCourseInfo *)navigationController.topViewController;
        controller.delegate = self;
    }else if ([segue.identifier isEqualToString:@"EditItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddCourseInfo *controller = (AddCourseInfo *)navigationController.topViewController;
        controller.delegate = self;
        controller.itemToEdit = sender;
    }
}

///The delegate usually responds to the tap on the disclosure button (the accessory view) by displaying a new view related to the selected row. This method is not called when an accessory view is set for the row at indexPath.
///When accessory item is tapped, edit item will be presented of the selected item

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
    CourseStore *item = [items objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"EditItem" sender:item];
    
}



///Save the edited item and dismiss view controller presented

- (void)addItemViewController:(AddCourseInfo *)controller didFinishEditingItem:(CourseStore *)item
{
    int index = (int)[items indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    CustomCouseCell *cell = (CustomCouseCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    [self configureTextForCell:cell withChecklistItem:item];
    [self saveChecklistItems];
    [self dismissViewControllerAnimated:YES completion:nil];
}

///A UIRefreshControl object provides a standard control that can be used to initiate the refreshing of a table view’s contents. You link a refresh control to a table through an associated table view controller object. The table view controller handles the work of adding the control to the table’s visual appearance and managing the display of that control in response to appropriate user gestures. In addition to assigning a refresh control to a table view controller’s refreshControl property, you must configure the target and action of the control itself. The control does not initiate the refresh operation directly. Instead, it sends the UIControlEventValueChanged event when a refresh operation should occur. You must assign an action method to this event and use it to perform whatever actions are needed. The UITableViewController object that owns a refresh control is also responsible for setting that control’s frame rectangle. Thus, you do not need to manage the size or position of a refresh control directly in your view hierarchy.

///refresh (aka pulltorefresh activated additem identifier. Upon activation, we stop refreshing.

- (void)refresh
{
    [self performSegueWithIdentifier:@"AddItem" sender:self];
    
    [self.refreshControl endRefreshing];
    
}


///Define whether reorder is allowed. Set to NO if reorder is not allowed

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}



/// Identfy which row is reordered and update the table view and save the plist file.

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    id objectToMove = [items objectAtIndex:fromIndexPath.row];
    [items removeObjectAtIndex:fromIndexPath.row];
    [items insertObject:objectToMove atIndex:toIndexPath.row];
    [tableView reloadData];
    [self saveChecklistItems];
}

- (BOOL) tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    return YES;
}
-(void)viewDidAppear:(BOOL)animated
{
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
}

@end
