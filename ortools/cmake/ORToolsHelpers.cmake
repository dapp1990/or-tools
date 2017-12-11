FUNCTION(GET_VERSION_FROM_FILE VERSION_MAJOR VERSION_MINOR VERSION_PATCH)
    FILE(STRINGS "Version.txt" VERSION_DESC)
    FOREACH(_VERSION_DESC ${VERSION_DESC})
        IF(${_VERSION_DESC} MATCHES "OR_TOOLS_MAJOR = (.*)")
            SET(${VERSION_MAJOR} ${CMAKE_MATCH_1} PARENT_SCOPE)
        ENDIF()

        IF(${_VERSION_DESC} MATCHES "OR_TOOLS_MINOR = (.*)")
            SET(${VERSION_MINOR} ${CMAKE_MATCH_1} PARENT_SCOPE)
        ENDIF()
    ENDFOREACH()
ENDFUNCTION()

FUNCTION(GET_VERSION_FROM_GIT OUTPUT_VAR VERSION_MAJOR_ VERSION_MINOR_ VERSION_PATCH_)
    FIND_PACKAGE(Git QUIET)
    IF(GIT_FOUND)
        EXECUTE_PROCESS(COMMAND
            ${GIT_EXECUTABLE}
            "describe" "--tags"
            RESULT_VARIABLE _OUTPUT_VAR
            OUTPUT_VARIABLE VERSION_FULL
            ERROR_QUIET)

        IF(NOT _OUTPUT_VAR)
            EXECUTE_PROCESS(COMMAND
                ${GIT_EXECUTABLE}
                "log" "--oneline"
                COMMAND
                "wc"
                "-l"
                RESULT_VARIABLE _OUTPUT_VAR
                OUTPUT_VARIABLE _VERSION_PATCH
                ERROR_QUIET)
            STRING(STRIP _VERSION_PATCH ${_VERSION_PATCH})
            STRING(REGEX REPLACE "\n$" "" _VERSION_PATCH ${_VERSION_PATCH})
            STRING(REGEX REPLACE " " "" _VERSION_PATCH ${_VERSION_PATCH})
            STRING(REGEX REPLACE "^v([0-9]+)\\..*" "\\1" _VERSION_MAJOR "${VERSION_FULL}")
            STRING(REGEX REPLACE "^v[0-9]+\\.([0-9]+).*" "\\1" _VERSION_MINOR "${VERSION_FULL}")

            SET(${VERSION_MAJOR_} "${_VERSION_MAJOR}" PARENT_SCOPE)
            SET(${VERSION_MINOR_} "${_VERSION_MINOR}" PARENT_SCOPE)
            SET(${VERSION_PATCH_} "${_VERSION_PATCH}" PARENT_SCOPE)
        ENDIF()
    ENDIF()
    SET(${OUTPUT_VAR} "${_OUTPUT_VAR}" PARENT_SCOPE)
ENDFUNCTION()

FUNCTION(SET_VERSION VERSION)
    FIND_PACKAGE(Git QUIET)
    IF(GIT_FOUND)
        GET_VERSION_FROM_GIT(GIT_OUTPUT VERSION_MAJOR VERSION_MINOR VERSION_PATCH)

        IF(GIT_OUTPUT)
            GET_VERSION_FROM_FILE(VERSION_MAJOR VERSION_MINOR VERSION_PATCH)
        ENDIF()
    ELSE()
        GET_VERSION_FROM_FILE(VERSION_MAJOR VERSION_MINOR VERSION_PATCH)
    ENDIF()
    SET(_VERSION "${VERSION_MAJOR}.${VERSION_MINOR}")
    IF(VERSION_PATCH)
        SET(_VERSION "${_VERSION}.${VERSION_PATCH}")
    ENDIF()
    SET(${VERSION} ${_VERSION} PARENT_SCOPE)
ENDFUNCTION()

function(check_target my_target)
  if(NOT TARGET ${my_target})
		message(FATAL_ERROR " Or-Tools: compiling Or-Tools requires a ${my_target}
		CMake target in your project, see CMake/README.md for more details")
  endif(NOT TARGET ${my_target})
endfunction()
