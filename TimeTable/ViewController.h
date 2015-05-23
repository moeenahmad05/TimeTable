
//

#import <UIKit/UIKit.h>
#import "DKVerticalColorPicker.h"

@class ViewController;

@protocol ViewControllerDelegate <NSObject>

- (void)ColorPickerDidCancel:(ViewController *)picker;
- (void)ColorPick:(ViewController*)picker didPickcolor:(UIColor *)color;


@end


@interface ViewController : UIViewController <DKVerticalColorPickerDelegate>

@property (nonatomic, weak) id <ViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *sampleLabel;

//@property(strong , nonatomic) UIColor *colors;

-(void)colorPicked:(UIColor *)color;



- (IBAction)cancel;
- (IBAction)done;


@end

