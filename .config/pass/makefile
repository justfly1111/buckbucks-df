# -*- mode: makefile-gmake; -*-
SRC := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

include ../lib/shared.mk
TARGET := ~/.password-store

install: | init update

init:
	if (( $$+commands[pass] )) ; then
		$(report) header "Setting up pass"
		[ -e $(TARGET) ] \
			&& $(mk_link) $(SRC)/extensions $(TARGET)/.extensions \
			|| $(report) warn "$(TARGET) doesn't exist. Skipping."
	else
		$(report) debug " pass not installed. Skipping."
	fi

update:


remove:
	$(report) header "Removing pass"
	$(rm_link) $(TARGET)
