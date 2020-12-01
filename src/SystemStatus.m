#import "../include/SystemStatus.h"
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/sysctl.h>
#include <stdlib.h>

#define DYLIB_PATH @"/Library/MobileSubstrate/DynamicLibraries/"

@implementation SunflsksSystemStatus

+(long long)batteryPercent {
    UIDevice* device = [UIDevice currentDevice];
	[device setBatteryMonitoringEnabled:YES];

	float battery = [device batteryLevel] * 100;

	return lroundf(battery);
}

+(NSString*)stringWithChargingStatus {
	NSString* string;
	UIDevice* device = [UIDevice currentDevice];
	[device setBatteryMonitoringEnabled:YES];

	int state = [device batteryState];

	switch (state) {
		case UIDeviceBatteryStateUnplugged: {
			string = @"unplugged";
			break;
		}

		case UIDeviceBatteryStateCharging: {
			string = @"charging";
			break;
		}

		case UIDeviceBatteryStateFull: {
			string = @"full";
			break;
		}

		default: {
			string = @"error";
			break;
		}
	}

	return string;
}

+(NSString*)stringWithUptime {
	NSMutableString* string = [NSMutableString string];
	struct timespec uptime;
	clock_gettime(CLOCK_MONOTONIC_RAW, &uptime);
	
	[string appendString:[NSString stringWithFormat:@"%lu days, %lu hours, %lu minutes, %lu seconds", (uptime.tv_sec % (86400 * 30)) / 86400, (uptime.tv_sec % 86400) / 3600, (uptime.tv_sec % 3600) / 60, uptime.tv_sec % 60]];
	return string;
}

+(long long)tweakCount {
	long long dylibCount = 0;
	NSArray* dylibs = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:DYLIB_PATH error:nil];

	for (NSURL* url in dylibs) {
		if ([[url pathExtension] isEqualToString:@"dylib"]) {
			dylibCount++;
		}
	}

	return dylibCount;
}

+(long long)packageCount {
	FILE* pipe = NULL;
	char* buffer = calloc(500, sizeof(char));
	long long ret = 0;

	pipe = popen("/usr/bin/dpkg -l | grep ii | wc -l", "r");
	if (!pipe) {
		return ret;
	}
	
	fgets(buffer, 500, pipe);
	if (!buffer) {
		return ret;
	}
	
	if (pclose(pipe) != 0) {
		free(buffer);
		return ret;
	}
	
	ret = atoll(buffer);
	free(buffer);
	return ret;
}

+(NSArray*)processes {
	NSMutableString* string = [NSMutableString string];
    char* buffer = calloc(1024, sizeof(char));

    FILE* pipe = popen("ps ax | awk '{print $5}' | tail -n +2", "r");
    if(!pipe) {
        return nil;
    }

    while(fgets(buffer, 1024, pipe)) {
        [string appendString:[NSString stringWithFormat:@"%s", buffer]];
    }
	free(buffer);
    return [string componentsSeparatedByString:@"\n"];
}

+(long long)processCount {
	    char* buffer = calloc(500, sizeof(char));
		FILE* pipe = popen("ps ax | awk '{print $5}' | tail -n +2 | wc -l", "r");

		fgets(buffer, 500, pipe);
		
		free(buffer);
		return atoll(buffer);
}

@end