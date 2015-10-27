#import "AlarmQuestion.h"
#import "SetViewController.h"
#import "AlarmItem.h"

#import "AlarmViewController.h"
#import "AlarmItemStore.h"


@implementation AlarmQuestion

@synthesize Num1;
@synthesize Num2;
@synthesize showQuestion;
@synthesize stringAnswer;

- (NSString *)description
{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@ * %@ = ?",
     self.Num1,
     self.Num2];
    
    return descriptionString;
}
- (instancetype)initWithNum1:(NSNumber *)num1
                        Num2:(NSNumber *)num2
              QuestionResult:(NSNumber *)questionResult
{
    self = [super init];
    if (self) {
        self.Num1 = num1;
        self.Num2 = num2;
        self.QuestionResult = questionResult;
    }
    return self;
}

+ (instancetype)initQuestion:(NSString *)puzzleLevel
{
//    AlarmItem *item = [[AlarmItem alloc] init];
//    AlarmItem *item = self.item;
//    NSString *puzzleLevel = item.PuzzleLevel;
    NSLog(@"puzzlelevel is %@", puzzleLevel);
    int labelNumber;
    if ([puzzleLevel isEqualToString:@"Level 1: 9*9"])
    {
        labelNumber = 1;
    }else if ([puzzleLevel isEqualToString:@"Level 2: 9*99"])
    {
        labelNumber = 2;
    }else if ([puzzleLevel isEqualToString:@"Level 3: 99*99"])
    {
        labelNumber = 3;
    }
    
    int randomNum1 = 0;
    int randomNum2 = 0;
    
    switch((int)labelNumber)
    {
        case 1:
            
            randomNum1 = 10;
            randomNum2 = 10;
            break;
            
        case 2:
            
            randomNum1 = 10;
            randomNum2 = 100;
            break;

        case 3:
            randomNum1 = 100;
            randomNum2 = 100;
            break;

    }
    NSLog(@"rand is %d", arc4random());
    NSLog(@"rand is %d", randomNum1);
    
    int frountIndex = arc4random() % randomNum1;
    int behindIndex = arc4random() % randomNum2;
    
    NSLog(@"index1: %d", frountIndex);
    NSLog(@"index2: %d", behindIndex);
    
    int num1 = frountIndex;
    int num2 = behindIndex;
    int answer = num1 * num2;
    
    NSLog(@"num1: %d", num1);
    NSLog(@"num2: %d", num2);
    NSLog(@"answer: %d", answer);
    
    AlarmQuestion *newQuestion = [[AlarmQuestion alloc] init];
    
    newQuestion.stringAnswer = [NSString stringWithFormat:@"%d",answer];
    
    newQuestion.showQuestion = [NSString stringWithFormat:@"%d * %d = ?", num1, num2];
        
    NSLog(@"Question: %@", newQuestion.showQuestion);
    NSLog(@"Answer: %@", newQuestion.stringAnswer);
    
    return newQuestion;
}

- (id)initWithItemName:(NSString *)ques
           alarmAnswer:(NSString *)ans
{
    self = [super init];
    if (self) {
        _itemName = ques;
        _alarmAnswer = ans;
    }
    return self;
}

- (void)setAlarmItem:(AlarmItem *)item
{
    item = item;
}

@end
