#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <unistd.h>
#include <limits.h>

#if defined(__APPLE__)
// https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man3/dyld.3.html
#include <mach-o/dyld.h>
#endif

int main(int argc, char* argv[]) {
#if defined(__APPLE__)
    uint32_t bufSize = 0U;
    _NSGetExecutablePath(NULL, &bufSize);

    char selfExePath[bufSize];
    _NSGetExecutablePath(selfExePath, &bufSize);

    int n = bufSize - 1;
#elif defined(__linux__)
    char selfExePath[PATH_MAX];

    int n = readlink("/proc/self/exe", selfExePath, PATH_MAX);

    if (n == -1) {
        perror("/proc/self/exe");
        return 1;
    }

    selfExePath[n] = '\0';
#endif

    ////////////////////////////////////////////////////

    int slashIndex = -1;

    char realExePath[n + 5];

    for (int i = 0; i < n; i++) {
        realExePath[i] = selfExePath[i];

        if (selfExePath[i] == '/') {
            slashIndex = i;
        }
    }

    realExePath[n    ] = '.';
    realExePath[n + 1] = 'e';
    realExePath[n + 2] = 'x';
    realExePath[n + 3] = 'e';
    realExePath[n + 4] = '\0';

    ////////////////////////////////////////////////////

    if (argv[1] == NULL || strcmp(argv[1], "intercept") == 0 || strcmp(argv[1], "citnames") == 0) {
        argv[0] = realExePath;
        execv (realExePath, argv);
        perror(realExePath);
        return 255;
    }

    ////////////////////////////////////////////////////

    const char * const s1 = "../lib/bear/libexec.dylib";
    const char * const s2 = "../lib/bear/wrapper";
    const char * const s3 = "../lib/bear/wrapper.d";

    ////////////////////////////////////////////////////

    char libexecFilePath[slashIndex + 30];

    for (int i = 0; i <= slashIndex; i++) {
        libexecFilePath[i] = selfExePath[i];
    }

    char * p = libexecFilePath + slashIndex + 1;

    for (int i = 0; ; i++) {
        p[i] = s1[i];

        if (s1[i] == '\0') {
            break;
        }
    }

    ////////////////////////////////////////////////////

    char wrapperFilePath[slashIndex + 30];

    for (int i = 0; i <= slashIndex; i++) {
        wrapperFilePath[i] = selfExePath[i];
    }

    p = wrapperFilePath + slashIndex + 1;

    for (int i = 0; ; i++) {
        p[i] = s2[i];

        if (s2[i] == '\0') {
            break;
        }
    }

    ////////////////////////////////////////////////////

    char wrapperdFilePath[slashIndex + 30];

    for (int i = 0; i <= slashIndex; i++) {
        wrapperdFilePath[i] = selfExePath[i];
    }

    p = wrapperdFilePath + slashIndex + 1;

    for (int i = 0; ; i++) {
        p[i] = s3[i];

        if (s3[i] == '\0') {
            break;
        }
    }

    ////////////////////////////////////////////////////

    char* argv2[argc + 9];

    argv2[0] = realExePath;
    argv2[1] = (char*)"--bear-path";
    argv2[2] = selfExePath;
    argv2[3] = (char*)"--library";
    argv2[4] = libexecFilePath;
    argv2[5] = (char*)"--wrapper";
    argv2[6] = wrapperFilePath;
    argv2[7] = (char*)"--wrapper-dir";
    argv2[8] = wrapperdFilePath;

    for (int i = 1; i < argc; i++) {
        argv2[i + 8] = argv[i];
    }

    argv2[argc + 8] = NULL;

    //for (int i = 0; argv2[i] != NULL; i++) {
    //    printf("%d:%s\n", i, argv2[i]);
    //}

    execv (realExePath, argv2);
    perror(realExePath);
    return 255;
}
