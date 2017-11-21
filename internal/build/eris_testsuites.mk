#ifdef VULCAN_TOOLKIT_BASE

#ifndef PROFILE
#include $(ROOTDIR)/build/getprofile.mk
#include $(ROOTDIR)/build/config/$(PROFILE).mk
#endif
#include $(ROOTDIR)/build/config/DetectOS.mk

ifdef VULCAN_TOOLKIT_BASE
include $(VULCAN_TOOLKIT_BASE)/build/config/DetectOS.mk
else
include $(ROOTDIR)/build/config/DetectOS.mk
endif

ifndef PROFILE
ifdef VULCAN_TOOLKIT_BASE
include $(VULCAN_TOOLKIT_BASE)/build/getprofile.mk
include $(VULCAN_TOOLKIT_BASE)/build/config/$(PROFILE).mk
else
include $(ROOTDIR)/build/getprofile.mk
include $(ROOTDIR)/build/config/$(PROFILE).mk
endif
endif


USE_NEW_PROJECT_MK := 1
ARCH_NEG_FILTER += 20 21



ifdef ERIS_TEST_LEVELS
ifdef VULCAN
BINPATH=${VULCAN_BUILD_DIR}/bin/${VULCAN_ARCH}_${VULCAN_OS}${VULCAN_ABI}_${VULCAN_BUILD}
else
BINPATH=$(ROOTDIR)/bin/$(TARGET_DIR)
endif
endif  # ERIS_TEST_LEVELS

ifeq ($(OS),Linux)
DEL_CMD=rm -f $(BINPATH)/*.vlct
else
DEL_CMD=if exist "$(BINPATH)\*.vlct" del "$(BINPATH)\*.vlct"
endif

all:
	echo "*********************************************************************"
	echo "Email blelbach@nvidia.com and explain to him what script/system is calling this makefile, where it lives in perforce, and where the up-to-date documentation is on how to update it"
	echo "*********************************************************************"
	exit 17
	#$(PYTHON) $(ROOTDIR)/thrust/generate_eris_vlct.py $(BINPATH) $(ERIS_TEST_LEVELS)

clean:
	echo "*********************************************************************"
	echo "Email blelbach@nvidia.com and explain to him what script/system is calling this makefile, where it lives in perforce, and where the up-to-date documentation is on how to update it"
	echo "*********************************************************************"
	exit 17
	#$(DEL_CMD)

ifdef VULCAN_TOOLKIT_BASE
include $(VULCAN_TOOLKIT_BASE)/build/common.mk
else
include $(ROOTDIR)/build/common.mk
endif
