#====================
AUTHOR         ?= sh0jitmy 
COPYRIGHT_YEAR ?= 2026- 

BIN            ?= monitoring-suite-use-app
GO_FILES       ?= $(shell find . -name '*.go')

include includes/go/common.mk
#====================



tools: dev-tools 