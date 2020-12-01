#include "../include/ProcessManager.h"
#include <signal.h>
#include <errno.h>

extern int errno;

@implementation ProcessManager {
    pid_t PID;
}
@synthesize pid = PID;

-(ProcessManager*)initWithPID:(pid_t)pid {
    self = [super init];

    if (!self) {
        return nil;
    }

    PID = pid;
    return self;
}

-(ProcessOutput)kill {
    ProcessOutput output;

    if (kill(PID, SIGTERM) != 0) {
        switch (errno) {
            case EINVAL:
                output = INVALID_SIGNAL;
                break;

            case EPERM:
                output = NOT_ALLOWED;
                break;

            case ESRCH:
                output = NONEXISTENT_PID;
                break;
        }
    }    

    else {
        output = SUCCESS;
    }

    return output;
}

-(ProcessOutput)kill:(int)signal {
    ProcessOutput output;

    if (kill(PID, signal) != 0) {
        switch (errno) {
            case EINVAL:
                output = INVALID_SIGNAL;
                break;

            case EPERM:
                output = NOT_ALLOWED;
                break;

            case ESRCH:
                output = NONEXISTENT_PID;
                break;
        }
    }

    else {
        output = SUCCESS;
    }    

    return output;
}

@end