LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

# add mediactl.c to avoid link librkisp.so apparently
LOCAL_SRC_FILES +=\
	rkisp_demo.cpp \
	../interface/mediactl.c \

LOCAL_CPPFLAGS += -std=c++11 -Wno-error
LOCAL_CPPFLAGS += -DLINUX 
LOCAL_CPPFLAGS += $(PRJ_CPPFLAGS)

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/../interface \
	$(LOCAL_PATH)/../metadata/header_files/include \
	$(LOCAL_PATH)/../metadata/libcamera_client/include \
	$(LOCAL_PATH)/../metadata/libcamera_metadata/include \
	$(LOCAL_PATH)/../metadata/header_files/include/system/core/include \
	$(LOCAL_PATH)/../ \
	$(LOCAL_PATH)/../xcore \
	$(LOCAL_PATH)/../xcore/ia \
	$(LOCAL_PATH)/../ext/rkisp \
	$(LOCAL_PATH)/../plugins/3a/rkiq \
	$(LOCAL_PATH)/../modules/isp \
	$(LOCAL_PATH)/../rkisp/ia-engine \
	$(LOCAL_PATH)/../rkisp/ia-engine/include \
    $(LOCAL_PATH)/../rkisp/ia-engine/include/linux \
    $(LOCAL_PATH)/../rkisp/ia-engine/include/linux/media \
	$(LOCAL_PATH)/../rkisp/isp-engine

LOCAL_SHARED_LIBRARIES += libdl

ifeq ($(IS_ANDROID_OS),true)
LOCAL_SHARED_LIBRARIES += libutils libcutils
LOCAL_CFLAGS += -DANDROID
ifeq (1,$(strip $(shell expr $(PLATFORM_VERSION) \>= 8.0)))
LOCAL_CFLAGS += -DANDROID_VERSION_ABOVE_8_X
LOCAL_STATIC_LIBRARIES += android.hardware.camera.common@1.0-helper
endif
endif

LOCAL_MODULE:= rkisp_demo

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_SRC_FILES +=\
	test_camcl.cpp

LOCAL_CPPFLAGS += -std=c++11 -Wno-error
LOCAL_CPPFLAGS += -DLINUX 
LOCAL_CPPFLAGS += $(PRJ_CPPFLAGS)

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/../interface \
	$(LOCAL_PATH)/../metadata/header_files/include \
	$(LOCAL_PATH)/../metadata/libcamera_client/include \
	$(LOCAL_PATH)/../metadata/libcamera_metadata/include \
	$(LOCAL_PATH)/../metadata/header_files/include/system/core/include \
	$(LOCAL_PATH)/../ \
	$(LOCAL_PATH)/../xcore \
	$(LOCAL_PATH)/../xcore/ia \
	$(LOCAL_PATH)/../ext/rkisp \
	$(LOCAL_PATH)/../plugins/3a/rkiq \
	$(LOCAL_PATH)/../modules/isp \
	$(LOCAL_PATH)/../rkisp/ia-engine \
	$(LOCAL_PATH)/../rkisp/ia-engine/include \
    $(LOCAL_PATH)/../rkisp/ia-engine/include/linux \
    $(LOCAL_PATH)/../rkisp/ia-engine/include/linux/media \
	$(LOCAL_PATH)/../rkisp/isp-engine

LOCAL_SHARED_LIBRARIES += libdl librkisp

ifeq ($(IS_ANDROID_OS),true)
LOCAL_SHARED_LIBRARIES += libutils libcutils
LOCAL_CFLAGS += -DANDROID
ifeq (1,$(strip $(shell expr $(PLATFORM_VERSION) \>= 8.0)))
LOCAL_CFLAGS += -DANDROID_VERSION_ABOVE_8_X
LOCAL_STATIC_LIBRARIES += android.hardware.camera.common@1.0-helper
endif
endif

LOCAL_MODULE:= test_ispcl

#include $(BUILD_EXECUTABLE)
