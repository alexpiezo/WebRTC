#!/bin/sh

checkout_depot_tools() { 
    if [ ! -d depot_tools ]; then
        echo "${C_GREEN}${C_GREY0}Checkout depot tools...${NO_FORMAT}"
        git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
    else
        echo "${C_GREEN}${C_GREY0}Depot tools exist; pull changes${NO_FORMAT}"
        cd depot_tools
        git pull origin master
        cd ..
    fi
    export PATH=$(pwd)/depot_tools:$PATH
}

checkout_webrtc() {
    local branch=$1
    if [ ! -d src ]; then
        echo "${C_GREEN}${C_GREY0}Fetching WebRTC...${NO_FORMAT}"
	    fetch --nohooks webrtc_ios
    fi

    cd src
    echo "${C_GREEN}${C_GREY0}Checkout${NO_FORMAT} ${C_AQUA}${C_GREY0}${branch}${NO_FORMAT}"
    git checkout ${branch}
    cd ..
    gclient sync --with_branch_heads --with_tags    
}

checkout_depot_tools

if [[ -z "${WEBRTC_BRANCH}" ]]; then
    echo "WebRTC branch not set"
    exit 1
fi

checkout_webrtc "branch-heads/${WEBRTC_BRANCH}"