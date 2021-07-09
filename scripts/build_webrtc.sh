#!/bin/sh

TARGET_OS="${TARGET_OS:-ios}" # ios | mac
TARGET_CPU="${TARGET_CPU:-x64}" # x86 | arm | x64 | arm64
ENVIROMENT="${ENVIROMENT:-'simulator'}" # simulator | device
OUTPUT_DIR="../out"

gen_args="target_os=\"${TARGET_OS}\" \
target_cpu=\"${TARGET_CPU}\" \
is_debug=${IS_DEBUG:-false} \
is_component_build=${IS_COMPONENT_BUILD:-false} \
rtc_include_tests=${RTC_INCLUDE_TESTS:-false} \
rtc_libvpx_build_vp9=${RTC_LIBVPX_BUILD_VP9:-true} \
rtc_enable_symbol_export=${RTC_ENABLE_SYMBOL_EXPORT:-true} \
rtc_enable_protobuf=${RTC_ENABLE_PROTOBUF:-false} \
treat_warnings_as_errors=${TREAT_WARNINGS_AS_ERRORS:-false} \
enable_stripping=${ENABLE_STRIPPING:-true}"

if [[ $TARGET_OS = "ios" ]]
then
    gen_dir="${OUTPUT_DIR}/${TARGET_OS}-${TARGET_CPU}-${ENVIROMENT}"
    gen_args="${gen_args}\
    target_environment=\"${ENVIROMENT}\" \
    ios_deployment_target=\"10.0\" \
    ios_enable_code_signing=${IOS_ENABLE_CODE_SIGNING:-false} \
    enable_ios_bitcode=${ENABLE_IOS_BITCODE:-false} \
    use_xcode_clang=${USE_XCODE_CLANG:-true} \
    use_goma=${USE_GOMA:-false}"

    echo "${C_GREEN}${C_GREY0}Build ${TARGET_OS} ${TARGET_CPU}${NO_FORMAT} with args ${C_AQUA}${C_GREY0}${gen_args}${NO_FORMAT}"

    gn gen "${gen_dir}" --args="${gen_args}"
    ninja -C "${gen_dir}" framework_objc || exit 1    

elif [[ $TARGET_OS = "mac" ]]        
then
    gen_dir="${OUTPUT_DIR}/${TARGET_OS}-${TARGET_CPU}"

    echo "${C_GREEN}${C_GREY0}Build ${os} ${cpu}${NO_FORMAT} with args ${C_AQUA}${C_GREY0}${gen_args}${NO_FORMAT}"

    gn gen "${gen_dir}" --args="${gen_args}"
    ninja -C "${gen_dir}" mac_framework_objc || exit 1    
else
    echo "${C_RED}Wrong os ${os}${NO_FORMAT}"
    exit 1
fi