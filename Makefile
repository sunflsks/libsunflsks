TARGET := iphone:clang:latest:13.3

include $(THEOS)/makefiles/common.mk
ARCHS = arm64 arm64e
LIBRARY_NAME = libsunflsks
libsunflsks_FILES = $(wildcard Translate/*.m lib/*.m Network/*.m SystemStatus/*.m)
libsunflsks_CFLAGS = -fobjc-arc -Wno-deprecated
libsunflsks_INSTALL_PATH = /usr/local/lib

include $(THEOS_MAKE_PATH)/library.mk
