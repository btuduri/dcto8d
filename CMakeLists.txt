cmake_minimum_required(VERSION 3.9)
project(dcto8d)

find_package(SDL REQUIRED)
find_package(SDL_ttf REQUIRED)

include_directories(source)
include_directories(${SDL_INCLUDE_DIR} ${SDL_TTF_INCLUDE_DIRS})
set(SOURCES_FILE 
  ${PROJECT_SOURCE_DIR}/source/dc6809dass.c
  ${PROJECT_SOURCE_DIR}/source/dc6809emul.c
  ${PROJECT_SOURCE_DIR}/source/dcto8ddesass.c
  ${PROJECT_SOURCE_DIR}/source/dcto8ddevices.c
  ${PROJECT_SOURCE_DIR}/source/dcto8demulation.c
  ${PROJECT_SOURCE_DIR}/source/dcto8dinterface.c
  ${PROJECT_SOURCE_DIR}/source/dcto8dkeyb.c
  ${PROJECT_SOURCE_DIR}/source/dcto8dmain.c
  ${PROJECT_SOURCE_DIR}/source/dcto8doptions.c
  ${PROJECT_SOURCE_DIR}/source/dcto8dvideo.c
)

add_executable(dcto8d ${SOURCES_FILE})
target_link_libraries(dcto8d ${SDL_LIBRARY} ${SDL_TTF_LIBRARIES})

install(TARGETS dcto8d DESTINATION bin)

# add the uninstall support
configure_file(
	"${CMAKE_CURRENT_SOURCE_DIR}/cmake_uninstall.cmake.in"
	"${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
	@ONLY)
add_custom_target(uninstall
"${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake")

