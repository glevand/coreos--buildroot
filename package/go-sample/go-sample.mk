################################################################################
#
# go-sample
#
################################################################################

GO_SAMPLE_VERSION = v1
GO_SAMPLE_SITE = https://github.com/glevand/go-sample/archive
GO_SAMPLE_SOURCE = $(GO_SAMPLE_VERSION).tar.gz

GO_SAMPLE_LICENSE = Apache-2.0
GO_SAMPLE_LICENSE_FILES = LICENSE

GO_SAMPLE_DEPENDENCIES = host-go

GO_SAMPLE_MAKE_ENV = \
	$(HOST_GO_TARGET_ENV) \
	GOBIN="$(@D)/bin" \
	GOPATH="$(@D)/gopath" \
	CGO_ENABLED=0

define GO_SAMPLE_BUILD_CMDS
	cd $(@D) && $(GO_SAMPLE_MAKE_ENV) $(HOST_GO_ROOT)/bin/go \
		build -v -x -o $(@D)/bin/go-sample .
endef

define GO_SAMPLE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/go-sample $(TARGET_DIR)/usr/bin/go-sample
endef

$(eval $(generic-package))
