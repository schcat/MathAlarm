#import "AlarmItemStore.h"
#import "AlarmItem.h"

@interface AlarmItemStore()
@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation AlarmItemStore

@synthesize allItems;

+ (instancetype)sharedStore
{
    static AlarmItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BNRItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}
- (NSArray *)allItems
{
    return self.privateItems;
  //  return [self.privateItems copy];
}

- (AlarmItem *)createItem
{
    AlarmItem *item = [AlarmItem initItem];
    [self.privateItems addObject:item];
    return item;
}
-(void)removeItem:(AlarmItem *)item
{
    [self.privateItems removeObjectIdenticalTo:item];
}
- (void)moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    AlarmItem *item = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:item atIndex:toIndex];
}

- (NSString *)itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}

- (BOOL)saveChanges
{
    NSString *path = [self itemArchivePath];
    return [NSKeyedArchiver archiveRootObject:self.privateItems toFile:path];
}

@end
