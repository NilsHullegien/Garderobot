cmake_minimum_required(VERSION 2.8.3)
FIND_PACKAGE(PythonInterp)
FIND_PACKAGE(PythonLibs)
if(APPLE AND ${PYTHON_VERSION_MAJOR} EQUAL 3)
    FIND_PACKAGE(Boost COMPONENTS python3)
else()
    FIND_PACKAGE(Boost COMPONENTS python)
endif()


LINK_DIRECTORIES(.)

ENABLE_TESTING()
INCLUDE_DIRECTORIES(threemxl/include ${Boost_INCLUDE_DIRS} ${PYTHON_INCLUDE_DIRS})
LINK_LIBRARIES(${Boost_LIBRARIES} ${PYTHON_LIBRARIES} threemxl) # Deprecated but so convenient!

PYTHON_ADD_MODULE(carousel carousel.cpp)
FILE(COPY carousel.py DESTINATION .)
