

#import "ChecklistViewController.h"

@interface ChecklistViewController ()

@end

#import "ChecklistItem.h"


@implementation ChecklistViewController {
    
    NSMutableArray *items;
    
    
}

///synthesize the table view so that we can assign the banner view later where to show

@synthesize TableView;



///synthesize ilteredtabledata, searchbar and filterstatus
@synthesize filteredTableData;

@synthesize isFiltered;


- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
///title of view controller
    
    self.title = @"Lecturer List";

   
    
///table view background with our own custom image
    
  self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"I1.png"]];
    
 ///initialize pull to refresh control
    
    [self.refreshControl
     addTarget:self
     action:@selector(refresh)
     forControlEvents:UIControlEventValueChanged
     ];

  TableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
/// configure left navigation bar button item as edit button. This edit button has a mechanism of changing its title to "Done" when it pressed
  
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    
    
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
    return [[self documentsDirectory] stringByAppendingPathComponent:@"Checklists.plist"];
}



///Method to save the data to plist

- (void)saveChecklistItems
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:items forKey:@"ChecklistItems"];
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
        NSString *sourcePath=[[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:@"Checklists.plist"];
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
        items = [unarchiver decodeObjectForKey:@"ChecklistItems"];
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


- (CustomTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ChecklistItem";
    
    CustomTableViewCell *cell =(CustomTableViewCell*) [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];

 //   CustomTableViewCell *cell =  [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    

    if (cell == nil)
    
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    ChecklistItem* item;
    
    if(isFiltered)
        item = [filteredTableData objectAtIndex:indexPath.row];
    else
        item = [items objectAtIndex:indexPath.row];
    
    
 //   ChecklistItem *item = [items objectAtIndex:indexPath.row];
    
    [self configureTextForCell:cell withChecklistItem:item];

    

    return cell;

}












- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}



/// following method configures uitableviewcell text when user adds a new item

- (void)configureTextForCell:(CustomTableViewCell *)cell withChecklistItem:(ChecklistItem *)item
{
    
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.text;
    
    UILabel *labelwithoutnotes = (UILabel *)[cell viewWithTag:999];
    labelwithoutnotes.text = item.text;
    
    UILabel *notesLabel = (UILabel *)[cell viewWithTag:1500];
    notesLabel.text = item.notes;
    
    UILabel *labelemailid = (UILabel *)[cell viewWithTag:1002];
    labelemailid.text = item.emailid;
    
    UILabel *labelwebsite= (UILabel *)[cell viewWithTag:1004];
    labelwebsite.text = item.website;
    
   
}








- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [items removeObjectAtIndex:indexPath.row];
    [self saveChecklistItems];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
}







///The presenting view controller is responsible for dismissing the view controller it presented. If you call this method on the presented view controller itself, it automatically forwards the message to the presenting view controller.
///dismiss view controller presented

- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


///Save the added item and dismiss view controller presented

- (void)addItemViewController:(AddItemViewController *)controller didFinishAddingItem:(ChecklistItem *)item
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



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddItemViewController *controller = (AddItemViewController *)navigationController.topViewController;
        controller.delegate = self;
    }else if ([segue.identifier isEqualToString:@"EditItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddItemViewController *controller = (AddItemViewController *)navigationController.topViewController;
        controller.delegate = self;
        controller.itemToEdit = sender;
    }
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
    ChecklistItem *item = [items objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"EditItem" sender:item];
    
}



///Save the edited item and dismiss view controller presented

- (void)addItemViewController:(AddItemViewController *)controller didFinishEditingItem:(ChecklistItem *)item
{
    int index = (int)[items indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    CustomTableViewCell *cell = (CustomTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    [self configureTextForCell:cell withChecklistItem:item];
    [self saveChecklistItems];
    [self dismissViewControllerAnimated:YES completion:nil];
}



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
