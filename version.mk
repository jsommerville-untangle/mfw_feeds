MFW_VERSION ?= $(shell ../build/git-remote-find-tag.sh $(1))
MFW_COMMIT = $(shell ../build/git-remote-describe.sh $(1) $(2))

ifneq (,$(filter $(PKG_NAME),$(MFW_OTHER_PKG_NAMES)))
	PKG_SOURCE_VERSION := $(MFW_OTHER_PKG_BRANCH)
else
	PKG_SOURCE_VERSION := $(call MFW_VERSION,$(PKG_SOURCE_URL))
endif

PKG_VERSION := $(call MFW_COMMIT,$(PKG_SOURCE_URL),$(PKG_SOURCE_VERSION))

PKG_SOURCE_SUBDIR := $(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE := $(PKG_NAME)-$(PKG_SOURCE_VERSION)-$(PKG_VERSION).tar.xz
