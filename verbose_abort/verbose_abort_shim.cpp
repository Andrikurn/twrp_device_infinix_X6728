// Adapted from llvm-project/libcxx/src/verbose_abort.cpp for use as a
// standalone shim providing std::__1::__libcpp_verbose_abort(char const*, ...)
// on vendor binaries (Trustonic gatekeeper/keymint HAL services) linked
// against a newer libc++ ABI than what's present on this device's libc++.so.
//
// Original upstream file is part of the LLVM Project, under the Apache
// License v2.0 with LLVM Exceptions: https://llvm.org/LICENSE.txt

#include <cstdarg>
#include <cstdio>
#include <cstdlib>
#include <syslog.h>

extern "C" void android_set_abort_message(const char* msg);

extern "C" __attribute__((weak))
void _ZNSt3__122__libcpp_verbose_abortEPKcz(const char* format, ...) noexcept {
    // Write message to stderr first, in case anything below fails.
    {
        va_list list;
        va_start(list, format);
        std::vfprintf(stderr, format, list);
        va_end(list);
    }

    // Format into an allocated buffer for tombstone/logcat.
    // Leaked on purpose -- we're calling abort() right after.
    char* buffer = nullptr;
    va_list list;
    va_start(list, format);
    vasprintf(&buffer, format, list);
    va_end(list);

    // Show error in tombstone.
    android_set_abort_message(buffer);

    // Show error in logcat.
    openlog("libc++", 0, 0);
    syslog(LOG_CRIT, "%s", buffer);
    closelog();

    std::abort();
}