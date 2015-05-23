

#import <UIKit/UIKit.h>


///declare delagate methods

@class AddItemViewController;
@class ChecklistItem;

/// We pass the creted information to checkviewcontroller using delegate method.
@protocol AddItemViewControllerDelegate <NSObject>

///This method declares when user tap on the cancel button, it will dismiss the additem view controller presenting without saving the data
- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller;



///This method pass the relevant "added" information such as task, notes, whether to remind to checklistview controller
- (void)addItemViewController:(AddItemViewController *)controller didFinishAddingItem:(ChecklistItem *)item;




///This method pass the relevant "edited" information such as task, notes, whether to remind to checklistview controller
- (void)addItemViewController:(AddItemViewController *)controller didFinishEditingItem:(ChecklistItem *)item;
@end


/// confirm that textfield, datpicker and actionsheet delegates to self
@interface AddItemViewController : UITableViewController <UITextFieldDelegate >


/// textField is a field where user key in the task information. 
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextField *emailidField;
@property (strong, nonatomic) IBOutlet UITextField *websiteField;

/// notesField is a field where user key in the additional information.
@property (strong, nonatomic) IBOutlet UITextView *notesField;

/// We create doneBarButton as IBOutlet so that we can disable the done button if the text field is empty.
@property (nonatomic, strong) IBOutlet UIBarButtonItem *doneBarButton;

///confirms delegate method
@property (nonatomic, weak) id <AddItemViewControllerDelegate> delegate;

///We declare itemtoedit method to display information for user to edit 
@property (nonatomic, strong) ChecklistItem *itemToEdit;





///create IBActions

///We create cancel IBAction. when user tap on cancel button, we dismiss the presenting view controller by calling AddItemViewControllerDelegate using delegate method
- (IBAction)cancel;

///We create done IBAction. when user tap done button, we dismiss the presenting view controller by calling didFinishAddingItem using delegate method which will pass the added/edited information to checklistviewcontroller
- (IBAction)done;




@end