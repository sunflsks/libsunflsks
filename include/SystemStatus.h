@interface SunflsksSystemStatus : NSObject
+(long long)batteryPercent;
+(NSString*)stringWithChargingStatus;
+(NSString*)stringWithUptime;
+(long long)tweakCount;
+(long long)packageCount;
@end