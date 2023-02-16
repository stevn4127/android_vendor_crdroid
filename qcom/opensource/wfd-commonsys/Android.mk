LOCAL_PATH := $(call my-dir)
WFD_DISABLE_PLATFORM_LIST := neo

ifneq ($(filter $(QSSI_SUPPORTED_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)

#Disable WFD for selected 32-bit targets
ifeq ($(call is-board-platform,bengal),true)
ifeq ($(TARGET_BOARD_SUFFIX),_32)
WFD_DISABLE_PLATFORM_LIST += bengal
endif
endif

ifneq ($(call is-board-platform-in-list,$(WFD_DISABLE_PLATFORM_LIST)),true)
ifneq ($(TARGET_HAS_LOW_RAM), true)
include $(call all-makefiles-under, $(LOCAL_PATH))
endif
endif

endif
