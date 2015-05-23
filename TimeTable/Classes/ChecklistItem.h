

#import <Foundation/Foundation.h>



@interface ChecklistItem : NSObject <NSCoding>

///declare propertis of the items we want to store

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) BOOL checked;
@property (nonatomic, copy) NSString *notes;
@property (nonatomic, copy) NSString *emailid;
@property (nonatomic, copy) NSString *website;






///declare method to schedule local notification


///declare method when user tap on an item to mark it as compelted
- (void)toggleChecked;


@end