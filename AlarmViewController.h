#import <UIKit/UIKit.h>
#import "SetViewController.h"

@interface AlarmViewController : UIViewController

@property (nonatomic, retain) NSNumber *answer;

@property (nonatomic, strong) IBOutlet UIPickerView *resultPicker;
@property (nonatomic, strong) NSArray *pickerResult1;
@property (nonatomic, strong) NSArray *pickerResult2;
@property (nonatomic, strong) NSArray *pickerResult3;
@property (nonatomic, strong) NSArray *pickerResult4;

@property (nonatomic, strong) AlarmItem *item;

@property (nonatomic, retain) NSNumber *answerJudge;

@end
