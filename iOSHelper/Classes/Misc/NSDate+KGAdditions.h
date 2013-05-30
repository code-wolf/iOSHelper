// Part of FoundationKit http://foundationk.it
//
// Derived from enormego's BSD-Licensed cocoa-helpers: http://github.com/enormego/cocoa-helpers

#import <Foundation/Foundation.h>

@interface NSDate (KGAdditions)

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;
+ (NSDate *)dateWithYear:(NSInteger)year;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;
+ (NSDate *)nowByAddingTimeInterval:(NSTimeInterval)timeInterval;
+ (NSDate *)dateFromHTTPDateString:(NSString *)httpDateString;

- (NSString *)dateStringWithFormat:(NSString *)format;

- (BOOL)isBefore:(NSDate *)otherDate;
- (BOOL)isAfter:(NSDate *)otherDate;

- (BOOL)isToday;
- (BOOL)isYesterday;
- (BOOL)isTomorrow;
- (NSDate *)midnightDate;

- (NSDateComponents *)gregorianCalendarComponents;
- (NSInteger)secondComponent;
- (NSInteger)minuteComponent;
- (NSInteger)hourComponent;
- (NSInteger)dayComponent;
- (NSInteger)dayOfYearComponent;
- (NSInteger)weekdayComponent;
- (NSInteger)weekComponent;
- (NSInteger)weekOfYearComponent;
- (NSInteger)monthComponent;
- (NSInteger)yearComponent;

- (NSInteger)daysSinceDate:(NSDate *)date;
- (NSDate *)dateByAddingDays:(NSUInteger)days;
- (BOOL)isSameWeekAsDate:(NSDate *)date;
- (BOOL)isSameDayAsDate:(NSDate *)date;

@end
