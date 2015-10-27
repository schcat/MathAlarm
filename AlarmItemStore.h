#import <Foundation/Foundation.h>

@class AlarmItem;

@interface AlarmItemStore : NSObject{
    NSArray *allItems;
}

@property (nonatomic, retain, readonly) NSArray *allItems;

+ (instancetype)sharedStore;
- (AlarmItem *)createItem;
- (void)removeItem:(AlarmItem *)item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex;
- (BOOL)saveChanges;

@end
