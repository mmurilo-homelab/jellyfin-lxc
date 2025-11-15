#!/bin/bash

repo1="intel/compute-runtime"
repo2="intel/intel-graphics-compiler"

# dependencies
apt install -y jq ocl-icd-libopencl1 vainfo intel-media-va-driver

download_files() {
    local repo="$1"
    local dir="$2"

    rel=$(curl -s "https://api.github.com/repos/${repo}/releases/latest")
    urls=$(echo "${rel}" | jq -r '.assets[] | select(.name | endswith("deb")) | .browser_download_url')

    mkdir -p "${dir}"
    for url in ${urls}; do
        wget -nc -P "${dir}" "${url}"
    done
}

download_files "${repo1}" "intel-opencl"
download_files "${repo2}" "intel-opencl"

pushd "intel-opencl"
pkgs=(./*.{deb,ddeb})
apt install "${pkgs[@]}"
popd

apt policy intel-opencl-icd


echo "jellyfin installation:

curl https://repo.jellyfin.org/install-debuntu.sh | bash"
