#include <sys/sysctl.h>

@interface SunflsksProcessInfo : NSObject
-(SunflsksProcessInfo*)initWithProc:(struct extern_proc)proc;
-(pid_t)pid;
-(char)niceness;
-(int)uptime;
-(NSString*)name;
-(NSString*)description;
@end
