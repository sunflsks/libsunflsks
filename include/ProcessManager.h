#pragma once

typedef enum ProcessOutput {
    NOT_ALLOWED,
    NONEXISTENT_PID,
    INVALID_SIGNAL,
    SUCCESS
} ProcessOutput;

@interface ProcessManager : NSObject
-(ProcessManager*)initWithPID:(pid_t)PID;
-(ProcessOutput)kill;
-(ProcessOutput)kill:(int)signal;
@end