# Example Makefile for ROSE users
# This makefile is provided as an example of how to use ROSE when ROSE is
# installed (using "make install").  This makefile is tested as part of the
# "make distcheck" rule (run as part of tests before any CVS checkin).
# The test of this makefile can also be run by using the "make installcheck"
# rule (run as part of "make distcheck").


# Location of include directory after "make install"
# ROSE_INCLUDE_DIR = /opt/rose-edg4/install/include
ROSE_INCLUDE_DIR = /opt/rose-edg4/build
ROSE_BUILD_DIR = /opt/rose-edg4/build
ROSE_SOURCE_DIR = /opt/rose-edg4/source

# Location of Boost include directory
BOOST_CPPFLAGS = -pthread -I/usr/include

# Location of Dwarf include and lib (if ROSE is configured to use Dwarf)
ROSE_DWARF_INCLUDES =
ROSE_DWARF_LIBS_WITH_PATH =
ROSE_INCLUDE_DIR += $(ROSE_DWARF_INCLUDES)
ROSE_LIBS += $(ROSE_DWARF_LIBS_WITH_PATH)


CC                    = gcc
CXX                   = g++
CPPFLAGS              =
#CXXCPPFLAGS           = @CXXCPPFLAGS@
CXXFLAGS              =  -ggdb -O2 -Wall
LDFLAGS               =

# Location of library directory after "make install"
# ROSE_LIB_DIR = /opt/rose-edg4/install/lib
ROSE_LIB_DIR = /opt/rose-edg4/build/src
ROSE_LIBS = $(ROSE_LIB_DIR)/librose.la

ROSE_INCLUDES = \
     -I$(ROSE_INCLUDE_DIR) \
     -I$(ROSE_BUILD_DIR)/src/roseSupport \
     -I$(ROSE_BUILD_DIR)/src/frontend/SageIII \
     -I$(ROSE_SOURCE_DIR)/src \
     -I$(ROSE_SOURCE_DIR)/src/frontend/SageIII \
     -I$(ROSE_SOURCE_DIR)/src/frontend/SageIII/astFixup \
     -I$(ROSE_SOURCE_DIR)/src/frontend/SageIII/astPostProcessing \
     -I$(ROSE_SOURCE_DIR)/src/frontend/SageIII/astMerge \
     -I$(ROSE_SOURCE_DIR)/src/frontend/SageIII/astVisualization \
     -I$(ROSE_SOURCE_DIR)/src/frontend/SageIII/astFileIO \
     -I$(ROSE_SOURCE_DIR)/src/frontend/SageIII/sageInterface \
     -I$(ROSE_SOURCE_DIR)/src/frontend/SageIII/virtualCFG \
     -I$(ROSE_SOURCE_DIR)/src/frontend/SageIII/astTokenStream \
     -I$(ROSE_SOURCE_DIR)/src/frontend/SageIII/astHiddenTypeAndDeclarationLists \
     -I$(ROSE_BUILD_DIR)/src/frontend/SageIII/astFileIO \
     -I$(ROSE_SOURCE_DIR)/src/frontend/SageIII/astFromString \
     -I$(ROSE_SOURCE_DIR)/src/frontend/SageIII/includeDirectivesProcessing \
     -I$(ROSE_SOURCE_DIR)/src/frontend/OpenFortranParser_SAGE_Connection \
     -I$(ROSE_SOURCE_DIR)/src/frontend/ECJ_ROSE_Connection \
     -I$(ROSE_SOURCE_DIR)/src/frontend/PHPFrontend \
     -I$(ROSE_SOURCE_DIR)/src/frontend/PythonFrontend \
     -I$(ROSE_SOURCE_DIR)/src/frontend/BinaryDisassembly \
     -I$(ROSE_SOURCE_DIR)/src/frontend/BinaryFormats \
     -I$(ROSE_SOURCE_DIR)/src/frontend/BinaryLoader \
     -I$(ROSE_SOURCE_DIR)/src/frontend/Disassemblers \
     -I$(ROSE_SOURCE_DIR)/src/backend/unparser \
     -I$(ROSE_SOURCE_DIR)/src/backend/unparser/formatSupport \
     -I$(ROSE_SOURCE_DIR)/src/backend/unparser/languageIndependenceSupport \
     -I$(ROSE_SOURCE_DIR)/src/backend/unparser/CxxCodeGeneration \
     -I$(ROSE_SOURCE_DIR)/src/backend/unparser/JavaCodeGeneration \
     -I$(ROSE_SOURCE_DIR)/src/backend/unparser/FortranCodeGeneration \
     -I$(ROSE_SOURCE_DIR)/src/backend/unparser/PHPCodeGeneration \
     -I$(ROSE_SOURCE_DIR)/src/backend/unparser/PythonCodeGeneration \
     -I$(ROSE_SOURCE_DIR)/src/backend/unparser/X10CodeGeneration \
     -I$(ROSE_SOURCE_DIR)/src/backend/asmUnparser \
     -I$(ROSE_SOURCE_DIR)/src/util \
     -I$(ROSE_SOURCE_DIR)/src/util/support \
     -I$(ROSE_SOURCE_DIR)/src/util/graphs  \
     -I$(ROSE_SOURCE_DIR)/src/util/stringSupport \
     -I$(ROSE_SOURCE_DIR)/src/util/commandlineProcessing \
     -I$(ROSE_SOURCE_DIR)/src/midend/abstractHandle \
     -I$(ROSE_SOURCE_DIR)/src/midend/abstractMemoryObject \
     -I$(ROSE_SOURCE_DIR)/src/midend/astDiagnostics \
     -I$(ROSE_SOURCE_DIR)/src/midend/programTransformation/astInlining \
     -I$(ROSE_SOURCE_DIR)/src/midend/programTransformation/astOutlining  \
     -I$(ROSE_SOURCE_DIR)/src/midend/astProcessing \
     -I$(ROSE_SOURCE_DIR)/src/midend/astQuery \
     -I$(ROSE_SOURCE_DIR)/src/midend/astRewriteMechanism \
     -I$(ROSE_SOURCE_DIR)/src/midend/astUtil/annotation \
     -I$(ROSE_SOURCE_DIR)/src/midend/astUtil/astInterface \
     -I$(ROSE_SOURCE_DIR)/src/midend/astUtil/astSupport \
     -I$(ROSE_SOURCE_DIR)/src/midend/astUtil/symbolicVal \
     -I$(ROSE_SOURCE_DIR)/src/midend/binaryAnalyses \
     -I$(ROSE_SOURCE_DIR)/src/midend/binaryAnalyses/dataflowanalyses \
     -I$(ROSE_SOURCE_DIR)/src/midend/binaryAnalyses/instructionSemantics \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/genericDataflow \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/genericDataflow/simpleAnalyses \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/genericDataflow/cfgUtils \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/genericDataflow/variables \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/genericDataflow/analysis \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/genericDataflow/lattice \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/genericDataflow/state \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/annotationLanguageParser \
     -I$(ROSE_SOURCE_DIR)/src/midend/programTransformation/ompLowering \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/CFG \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/staticSingleAssignment \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/ssaUnfilteredCfg \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/systemDependenceGraph \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/systemDependenceGraph \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/CallGraphAnalysis \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/OAWrap \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/bitvectorDataflow \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/VirtualFunctionAnalysis \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/defUseAnalysis \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/distributedMemoryAnalysis \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/dominanceAnalysis \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/graphAnalysis \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/pointerAnal \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/staticInterproceduralSlicing \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/valuePropagation \
     -I$(ROSE_SOURCE_DIR)/src/midend/programAnalysis/variableRenaming \
     -I$(ROSE_SOURCE_DIR)/src/midend/programTransformation/partialRedundancyElimination \
     -I$(ROSE_SOURCE_DIR)/src/midend/programTransformation/finiteDifferencing \
     -I$(ROSE_SOURCE_DIR)/src/midend/programTransformation/functionCallNormalization \
     -I$(ROSE_SOURCE_DIR)/src/midend/programTransformation/constantFolding \
     -I$(ROSE_SOURCE_DIR)/src/midend/programTransformation/implicitCodeGeneration \
     -I$(ROSE_SOURCE_DIR)/src/roseSupport \
     -I$(ROSE_SOURCE_DIR)/src/3rdPartyLibraries/MSTL \
     -I$(ROSE_SOURCE_DIR)/src/3rdPartyLibraries/libharu-2.1.0/include \
     -I$(ROSE_BUILD_DIR)/src/3rdPartyLibraries/libharu-2.1.0/include \
     -I$(ROSE_SOURCE_DIR)/src/util/graphs \
     -I$(ROSE_SOURCE_DIR)/src/midend/astUtil/astInterface \
     -I$(ROSE_BUILD_DIR)/include-staging/gcc-4.4_HEADERS \
     -I$(ROSE_BUILD_DIR)/include-staging/g++-4.4_HEADERS \
     -I$(ROSE_SOURCE_DIR)/libltdl

SOURCES =	roseTool.C \

HEADERS =

OBJECTS = $(SOURCES:.C=.lo)


# Default make rule to use
all: exectool
	@if [ x$${ROSE_IN_BUILD_TREE:+present} = xpresent ]; then echo "ROSE_IN_BUILD_TREE should not be set" >&2; exit 1; fi



# Example suffix rule for more experienced makefile users
# .C.o:
#	g++ -c -I$(ROSE_INCLUDE_DIR) -o $@ $(@:.o=.C)

# Compile the exampleTranslator using the file identityTranslator.C
%.lo: %.C $(HEADERS)
	/bin/sh $(ROSE_BUILD_DIR)/libtool --tag=CXX --mode=compile $(CXX) $(CXXFLAGS)  $(CPPFLAGS) $(ROSE_INCLUDES) $(BOOST_CPPFLAGS) -c -o $@ $<

exectool: $(OBJECTS)
	/bin/sh $(ROSE_BUILD_DIR)/libtool --tag=CXX --mode=link $(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $(OBJECTS) $(ROSE_LIBS)

# Rule used by make installcheck to verify correctness of installed libraries
%.it.c: %.c exectool
	./exectool $(ROSE_INCLUDES) -plain -rose:o $< $@


clean:
	rm -rf .libs *.lo exectool *.o

