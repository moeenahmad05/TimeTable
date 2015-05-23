

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet DKVerticalColorPicker *vertPicker;
@property (nonatomic, weak) IBOutlet UIView *sampleView;


@end

@implementation ViewController
@synthesize sampleLabel;
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.vertPicker.selectedColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)colorPicked:(UIColor *)color
{
    self.sampleView.backgroundColor = color;
   self.sampleLabel.textColor = color;
 self.sampleLabel.backgroundColor = color;
}

-(IBAction)cancel
{
    [self.delegate ColorPickerDidCancel:self ];
}

-(IBAction)done
{
   
    [self.delegate ColorPick:self didPickcolor:self.sampleLabel.backgroundColor];
}


@end
