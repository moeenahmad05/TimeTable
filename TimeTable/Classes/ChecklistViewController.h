

#import <UIKit/UIKit.h>
#import "AddItemViewController.h"

#import "CustomTableViewCell.h"



@interface ChecklistViewController : UITableViewController <AddItemViewControllerDelegate>
{
    ///declare tableview and banner view for iAd banner
    
    UITableView *TableView;

    
    
}


//declare property of tableview. So that we can define whether the iAd panel shall be shown as header of table view or footer of table view.

@property (nonatomic, retain) IBOutlet UITableView *TableView;



///declare NSMutableArray property for filtered table data
@property (strong, nonatomic) NSMutableArray* filteredTableData;



///create a property to check the status
@property (nonatomic, assign) bool isFiltered;


@end
