#import "SetViewController.h"
#import "AlarmItem.h"

@interface SetViewController()

@property (weak, nonatomic) IBOutlet UILabel *showTime;
@property (weak, nonatomic) IBOutlet UILabel *showLevel;

@end

@implementation SetViewController

@synthesize datePicker;
@synthesize pickerTime;
@synthesize degreePicker;
@synthesize pickerDegree;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSDate *now = [NSDate date];
    [datePicker setDate:now animated:NO];
    NSArray *array = [[NSArray alloc] initWithObjects:@"Level 1: 9*9", @"Level 2: 9*99", @"Level 3: 99*99", nil];
    self.pickerDegree = array;
    
    NSString* date;
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"hh:mm"];
    date = [formatter stringFromDate:[NSDate date]];
    
    self.showTime.text = date;
    
    self.showLevel.text = @"Level 1: 9*9";
    
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)addReminder:(id)sender{
    
//    [self removeNotification];

    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)])
    {
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
        NSLog(@"local information");
    }
    
//    NSDate *selectedTime = [datePicker date];
    NSDate *date = self.datePicker.date;
    NSInteger row = [degreePicker selectedRowInComponent:0];
    NSString *selectedDegree = [pickerDegree objectAtIndex:row];
    AlarmItem *item = self.item;
    
    item.AlarmTime = date;
    item.PuzzleLevel = selectedDegree;
    NSLog(@"You a set an alarm at %@ with %@", item.AlarmTime, item.PuzzleLevel);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    self.showTime.text = destDateString;
    self.showLevel.text = selectedDegree;
    //注册了一个通知
    UILocalNotification *note = [[UILocalNotification alloc] init];

    note.soundName = @"nverqing.wav";
 //   newNotification.soundName = @"jingBao2.caf";
    note.alertBody = @"Wake up me!";
    note.fireDate = date;
    NSLog(@"Setting a reminder for %@", note.fireDate);
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setItem:(AlarmItem *)itemse
{
    _item = itemse;
 //   self.navigationItem.title = _item.NMTelContactName;
}

- (void)viewWillAppear:(BOOL)animated
{
    //  NSLog(@"%@", self.item);
    [super viewWillAppear:animated];
    
//    AlarmItem *item = self.item;
    
//    [datePicker setDate:item.AlarmTime animated:NO];
//    [degreePicker setValue:pickerDegree forKey:item.PuzzleLevel];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickerDegree count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerDegree objectAtIndex:row];
}

//#pragma mark
//-(void)removeNotification{
//    [[UIApplication sharedApplication] cancelAllLocalNotifications];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
