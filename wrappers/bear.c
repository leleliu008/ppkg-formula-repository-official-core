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

    char libexecFilePath[slashIndex + 30];

    for (int i = 0; i <= slashIndex; i++) {
        libexecFilePath[i] = selfExePath[i];
    }

    char * p = libexecFilePath + slashIndex + 1;

    const char * s = "../lib/bear/libexec.so";

    for (;;) {
        p[0] = s[0];

        if (p[0] == '\0') {
            break;
        }

        p++;
        s++;
    }

    ////////////////////////////////////////////////////

    char wrapperFilePath[slashIndex + 30];

    for (int i = 0; i <= slashIndex; i++) {
        wrapperFilePath[i] = selfExePath[i];
    }

    p = wrapperFilePath + slashIndex + 1;

    s = "../lib/bear/wrapper";

    for (;;) {
        p[0] = s[0];

        if (p[0] == '\0') {
            break;
        }

        p++;
        s++;
    }

    ////////////////////////////////////////////////////

    char wrapperdFilePath[slashIndex + 30];

    for (int i = 0; i <= slashIndex; i++) {
        wrapperdFilePath[i] = selfExePath[i];
    }

    p = wrapperdFilePath + slashIndex + 1;

    s = "../lib/bear/wrapper.d";

    for (;;) {
        p[0] = s[0];

        if (p[0] == '\0') {
            break;
        }

        p++;
        s++;
    }

    ////////////////////////////////////////////////////

    int   argc3 = 8;
    char* argv3[argc3];

    argv3[0] = (char*)"--bear-path"; 
    argv3[1] = selfExePath,
    argv3[2] = (char*)"--library";
    argv3[3] = libexecFilePath;
    argv3[4] = (char*)"--wrapper";
    argv3[5] = wrapperFilePath,
    argv3[6] = (char*)"--wrapper-dir";
    argv3[7] = wrapperdFilePath;

    ////////////////////////////////////////////////////

#if defined(__linux__) && defined(DYNAMIC_LOADER_FILENAME)
    const char * const dynamicLoaderName = "" DYNAMIC_LOADER_FILENAME;
    const char * const libraryPathRelativeToSelfExePath = "" LIBRARY_PATH_RELATIVE_TO_SELF_EXE_PATH;

    ////////////////////////////////////////////////////

    char libraryPath[PATH_MAX];

    for (int i = 0; i <= slashIndex; i++) {
        libraryPath[i] = selfExePath[i];
    }

    p = libraryPath + slashIndex + 1;

    for (int i = 0; ; i++) {
        p[i] = libraryPathRelativeToSelfExePath[i];

        if (p[i] == '\0') {
            break;
        }
    }

    ////////////////////////////////////////////////////

    char dynamicLoaderPath[PATH_MAX];

    int ret = snprintf(dynamicLoaderPath, PATH_MAX, "%s/%s", libraryPath, dynamicLoaderName);

    if (ret < 0) {
        perror(NULL);
        return 2;
    }

    ////////////////////////////////////////////////////

    char* argv2[argc + argc3 + 5 + 1];

    argv2[0] = dynamicLoaderPath;
    argv2[1] = (char*)"--library-path";
    argv2[2] = libraryPath;
    argv2[3] = (char*)"--argv0";
    argv2[4] = selfExePath;

    n = 5;
#else
    char* argv2[argc + argc3 + 1];
    n = 0;
#endif

    argv2[n++] = realExePath;

    for (int i = 0; i < argc3; i++) {
        argv2[n++] = argv3[i];
    }

    for (int i = 1; i < argc; i++) {
        argv2[n++] = argv[i];
    }

    argv2[n] = NULL;

    //for (int i = 0; argv2[i] != NULL; i++) {
    //    fprintf(stderr, "%d:%s\n", i, argv2[i]);
    //}

    execv (argv2[0], argv2);
    perror(argv2[0]);
    return 255;
}
