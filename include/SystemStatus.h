#include <sys/types.h>
#include <sys/stat.h>
#include <sys/sysctl.h>
#include <stdlib.h>
#include <stdbool.h>

@interface SunflsksSystemStatus : NSObject
+(long long)batteryPercent;
+(NSString*)stringWithChargingStatus;
+(NSString*)stringWithUptime;
+(long long)tweakCount;
+(long long)packageCount;
+(NSArray*)processes;
+(long long)processCount;
@end

@interface SunflsksProcessInfo : NSObject
-(SunflsksProcessInfo*)initWithProc:(struct extern_proc)proc;
-(pid_t)pid;
-(char)niceness;
-(int)uptime;
-(NSString*)name;
-(NSString*)description;
@end
