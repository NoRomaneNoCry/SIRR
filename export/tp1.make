# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifeq ($(config),debug)
  OBJDIR     = obj/debug/tp1
  TARGETDIR  = .
  TARGET     = $(TARGETDIR)/tp1
  DEFINES   += -DGK_OPENGL4 -DVERBOSE -DDEBUG
  INCLUDES  += -I. -IgKit
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -W -Wall -Wno-unused-parameter -std=c++11 -pipe
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += 
  LIBS      += -lGLEW -lSDL2 -lSDL2_image -lSDL2_ttf -lGL -lglfw
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release)
  OBJDIR     = obj/release/tp1
  TARGETDIR  = .
  TARGET     = $(TARGETDIR)/tp1
  DEFINES   += -DGK_OPENGL4 -DVERBOSE
  INCLUDES  += -I. -IgKit
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O3 -W -Wall -Wno-unused-parameter -std=c++11 -pipe -mtune=native
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -s
  LIBS      += -lGLEW -lSDL2 -lSDL2_image -lSDL2_ttf -lGL -lglfw
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),gprof)
  OBJDIR     = obj/gprof/tp1
  TARGETDIR  = .
  TARGET     = $(TARGETDIR)/tp1
  DEFINES   += -DGK_OPENGL4 -DVERBOSE
  INCLUDES  += -I. -IgKit
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -W -Wall -Wno-unused-parameter -std=c++11 -pipe
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -s
  LIBS      += -lGLEW -lSDL2 -lSDL2_image -lSDL2_ttf -lGL -lglfw
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/ImageManager.o \
	$(OBJDIR)/ImageIO.o \
	$(OBJDIR)/Geometry.o \
	$(OBJDIR)/App.o \
	$(OBJDIR)/Logger.o \
	$(OBJDIR)/ProgramTweaks.o \
	$(OBJDIR)/OrbiterIO.o \
	$(OBJDIR)/MeshData.o \
	$(OBJDIR)/Image.o \
	$(OBJDIR)/ImageArray.o \
	$(OBJDIR)/Transform.o \
	$(OBJDIR)/rgbe.o \
	$(OBJDIR)/ProgramManager.o \
	$(OBJDIR)/QuadMesh.o \
	$(OBJDIR)/MeshIO.o \
	$(OBJDIR)/ProgramName.o \
	$(OBJDIR)/GLProgram.o \
	$(OBJDIR)/GLBasicMaterial.o \
	$(OBJDIR)/GLQuery.o \
	$(OBJDIR)/GLTexture.o \
	$(OBJDIR)/GLProgramUniforms.o \
	$(OBJDIR)/GLBasicMesh.o \
	$(OBJDIR)/GLCompiler.o \
	$(OBJDIR)/nvContext.o \
	$(OBJDIR)/nvSDLFont.o \
	$(OBJDIR)/nvSDLContext.o \
	$(OBJDIR)/nvGLCorePainter.o \
	$(OBJDIR)/nvPainter.o \
	$(OBJDIR)/nvFont.o \
	$(OBJDIR)/tp1.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking tp1
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning tp1
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	-$(SILENT) cp $< $(OBJDIR)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
endif

$(OBJDIR)/ImageManager.o: gKit/ImageManager.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ImageIO.o: gKit/ImageIO.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Geometry.o: gKit/Geometry.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/App.o: gKit/App.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Logger.o: gKit/Logger.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ProgramTweaks.o: gKit/ProgramTweaks.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/OrbiterIO.o: gKit/OrbiterIO.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/MeshData.o: gKit/MeshData.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Image.o: gKit/Image.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ImageArray.o: gKit/ImageArray.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Transform.o: gKit/Transform.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/rgbe.o: gKit/rgbe.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ProgramManager.o: gKit/ProgramManager.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/QuadMesh.o: gKit/QuadMesh.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/MeshIO.o: gKit/MeshIO.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ProgramName.o: gKit/GL/ProgramName.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/GLProgram.o: gKit/GL/GLProgram.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/GLBasicMaterial.o: gKit/GL/GLBasicMaterial.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/GLQuery.o: gKit/GL/GLQuery.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/GLTexture.o: gKit/GL/GLTexture.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/GLProgramUniforms.o: gKit/GL/GLProgramUniforms.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/GLBasicMesh.o: gKit/GL/GLBasicMesh.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/GLCompiler.o: gKit/GL/GLCompiler.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/nvContext.o: gKit/Widgets/nvContext.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/nvSDLFont.o: gKit/Widgets/nvSDLFont.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/nvSDLContext.o: gKit/Widgets/nvSDLContext.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/nvGLCorePainter.o: gKit/Widgets/nvGLCorePainter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/nvPainter.o: gKit/Widgets/nvPainter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/nvFont.o: gKit/Widgets/nvFont.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/tp1.o: tp1.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)
