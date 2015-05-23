
 
#import <UIKit/UIKit.h>

/*!
 A delegate that gets notifications when the color picked changes.
 */
@protocol DKVerticalColorPickerDelegate <NSObject>
@optional
-(void)colorPicked:(UIColor *)color;
@end

IB_DESIGNABLE

@interface DKVerticalColorPicker : UIView

@property (nonatomic, weak) IBOutlet id<DKVerticalColorPickerDelegate> delegate;  //set after inited
@property (nonatomic) IBInspectable UIColor *selectedColor;  //setting this will update the UI & notify the delegate

@end

