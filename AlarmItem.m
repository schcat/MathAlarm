#import "AlarmItem.h"

@implementation AlarmItem

- (NSString *)description
{
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter){
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterNoStyle;
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
    }
    NSString *string = [dateFormatter stringFromDate:self.AlarmTime];
    
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@  %@",
     string,
     self.PuzzleLevel];
    
    return descriptionString;
}
- (instancetype)initWithAlarmTime:(NSDate *)alarmTime
                      PuzzleLevel:(NSString *)puzzleLevel
{
    self = [super init];
    if (self) {
        _AlarmTime = alarmTime;
        _PuzzleLevel = puzzleLevel;
    }
    return self;
}

+ (instancetype)initItem
{
    NSDate *date = [NSDate date];
    AlarmItem *newItem = [[self alloc] initWithAlarmTime:date
                                             PuzzleLevel:@"Level: 9*9"];
    return newItem;
}

@end
