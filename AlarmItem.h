#import <Foundation/Foundation.h>

@interface AlarmItem : NSObject
{
    NSDate *_AlarmTime;
    NSString *_PuzzleLevel;
}
- (instancetype)initWithAlarmTime:(NSDate *)alarmTime
                      PuzzleLevel:(NSString *)puzzleLevel;
+ (instancetype)initItem;

@property (nonatomic, copy) NSDate *AlarmTime;
@property (nonatomic, copy) NSString *PuzzleLevel;

@end
