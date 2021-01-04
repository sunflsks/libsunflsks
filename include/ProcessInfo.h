#pragma once
#include <sys/sysctl.h>

@interface SunflsksProcessInfo : NSObject
-(SunflsksProcessInfo*)initWithProc:(struct extern_proc)proc;
-(pid_t)pid;
// Broken: will return 0
-(char)niceness;
// Broken: wil return 0
-(int)uptime;
-(NSString*)name;
-(NSString*)description;
@end
