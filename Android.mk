ifeq ($(TARGET_LEGACY_CAMERA),true)

LOCAL_PATH := $(call my-dir)
include $(call all-subdir-makefiles)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS := -g -fPIC

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
    LOCAL_CFLAGS += -DQCOM_HARDWARE
endif

LOCAL_LDLIBS := -llog -ldl
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE    := camera.$(TARGET_BOARD_PLATFORM)
LOCAL_SRC_FILES := QualcommCameraHardware.cpp
LOCAL_PRELINK_MODULE := false
LOCAL_SHARED_LIBRARIES:= liblog libdl libutils libcamera_client libcamera libbinder libcutils

LOCAL_C_INCLUDES := frameworks/base/services/ frameworks/base/services/camera/libcameraservice/

include $(BUILD_SHARED_LIBRARY)

endif