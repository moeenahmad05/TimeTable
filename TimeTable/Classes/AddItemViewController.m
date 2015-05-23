

#import "AddItemViewController.h"
#import "ChecklistItem.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController {
    NSString *text;
    NSString *notes;
    NSString *emailid;
    NSString *website;
   }


///synthesize properties

@synthesize textField,websiteField,emailidField, notesField, doneBarButton;
@synthesize delegate;
@synthesize itemToEdit;


///we display current date and time when we present the additemvewcontroller to user
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        text = @"";
           }
    return self;
}






///we enable done bar button only when text field length is more than one character.
- (void)updateDoneBarButton
{
    if(([text length] > 0)&& ([notes length]> 0)&&([emailid length]> 0)&&([website length]> 0) )
    {
        self.doneBarButton.enabled = YES;
    }
    else
    {
        self.doneBarButton.enabled= NO;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
  

    
    /// custom background view with our own image
    
 self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"I1.png"]];


    
    ///we check whether it is editing mode or adding mode, then set the title and fields appropriately.  

    if (self.itemToEdit != nil) {
        self.title = @"Edit Lecturer Info";
        
    } else
        
        self.title = @"Add Lecturer Info";
    self.textField.text = text;
    self.notesField.text = notes;
    self.emailidField.text = emailid;
    self.websiteField.text = website;
  
   //[ self updateDoneBarButton];
    
}



- (void)viewWillAppear:(BOOL)animated
{
    
        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
        [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
    
    [super viewWillAppear:animated];
    
    if (self.title != NSLocalizedString(@"Edit Lecturer Info", nil)) {
        [self.textField becomeFirstResponder];
        
        
    }else
        [self.textField resignFirstResponder];
}





/// method to call addItemViewControllerDidCancel method when cancel button pressed

- (IBAction)cancel
{
    [self.delegate addItemViewControllerDidCancel:self];
}


/// method to call didFinishAddingItem method when Done button pressed


- (IBAction)done
{
    
    if(([textField.text length] > 0)&& ([notesField.text length]> 0)&&([emailidField.text length]> 0)&&([websiteField.text length]> 0) )
    {
       
    
    if (self.itemToEdit == nil) {
        ChecklistItem *item = [[ChecklistItem alloc] init];
        item.text = self.textField.text;
        item.notes = self.notesField.text;
        item.emailid = self.emailidField.text;
        item.website = self.websiteField.text;
        item.checked = NO;
                item.checked = NO;
       
        
        [self.delegate addItemViewController:self didFinishAddingItem:item];
    } else {
        self.itemToEdit.text = self.textField.text;
        self.itemToEdit.notes = self.notesField.text;
        self.itemToEdit.emailid = self.emailidField.text;
        self.itemToEdit.website = self.websiteField.text;
        
      
        [self.delegate addItemViewController:self didFinishEditingItem:self.itemToEdit];
    }
    

    
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please fill all fill in order to proceed" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        
        [alert show];
    }
        
}







///optionally we can dismiss keyboard if the user starts to scroll the tableview

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.textField resignFirstResponder];
    [self.notesField resignFirstResponder];
    [self.emailidField resignFirstResponder];
    [self.websiteField resignFirstResponder];
}




///to prevent the uitableview cell turns blue when user taps on it

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        return indexPath;
    } else {
        return nil;
    }
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

///release te memory by setting nil to these fields as we no loner need them

- (void)viewDidUnload
{
    [self setTextField:nil];
    [self setNotesField:nil];
    [self setEmailidField:nil];
    [self setWebsiteField:nil];
    [self setDoneBarButton:nil];
  
    [super viewDidUnload];
}


///we present stored item if the user editing an item

- (void)setItemToEdit:(ChecklistItem *)newItem
{
    if (itemToEdit != newItem) {
        itemToEdit = newItem;
        text = itemToEdit.text;
        notes = itemToEdit.notes;
        emailid = itemToEdit.emailid;
        website = itemToEdit.website;
      
         }
}




/*
/// method to check whether the text field has any text in it. if user type a text then it enables the Done bar button. otherwise it will disable the done bar button. therefore the user not able to press the button. this ensures that empty text are not delegated to checklistviewcontroller

#pragma mark - Table view data source

- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newText = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled = ([newText length] > 0);
    return YES;
}




- (BOOL)emailidField:(UITextField *)theEmailidField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newText = [theEmailidField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled = ([newText length] > 0);
    return YES;
}




- (BOOL)websiteField:(UITextField *)theWebsiteField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newText = [theWebsiteField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled = ([newText length] > 0);
    return YES;
}


- (BOOL)notesField:(UITextView *)theNotesField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newText = [theNotesField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled = ([newText length] > 0);
    return YES;
}


*/


@end
