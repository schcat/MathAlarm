#import <Foundation/Foundation.h>
#import "SetViewController.h"
@class AlarmItem;

@interface AlarmQuestion : NSObject{
    NSNumber *Num1;
    NSNumber *Num2;
    NSString *showQuestion;
    NSString *stringAnswer;
}

+ (instancetype)initQuestion:(NSString *)puzzleLevel;

- (instancetype)initWithNum1:(NSNumber *)num1
                        Num2:(NSNumber *)num2
                      QuestionResult:(NSNumber *)questionResult;
//- (instancetype)initItem;

@property (nonatomic, retain) NSNumber *Num1;
@property (nonatomic, retain) NSNumber *Num2;
@property (nonatomic, copy) NSNumber *QuestionResult;

@property (nonatomic, retain) NSString *showQuestion;
@property (nonatomic, retain) NSString *stringAnswer;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *alarmAnswer;

@property (nonatomic, strong) AlarmItem *item;

@end
