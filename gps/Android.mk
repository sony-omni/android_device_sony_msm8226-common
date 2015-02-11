#For all other targets
GPS_DIRS=core utils loc_api platform_lib_abstractions etc
include $(call all-named-subdir-makefiles,$(GPS_DIRS))

