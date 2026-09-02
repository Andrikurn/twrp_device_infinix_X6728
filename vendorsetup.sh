#!/bin/bash
#
# This file is part of the OrangeFox Recovery Project
# Copyright (C) 2020-2025 The OrangeFox Recovery Project
#
# OrangeFox is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# OrangeFox is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# This software is released under GPL version 3 or any later version.
# See <http://www.gnu.org/licenses/>.
#
# Please maintain this if you use this script or any part of it.
#

device_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
workspace_root="$(cd "${device_dir}/../../.." && pwd)"
vibration_patch_file="${device_dir}/patches/01-patch-vibration.patch"
health_patch_file="${device_dir}/patches/02-patch-health-hal.patch"

if [[ ! -f "${health_patch_file}" ]]; then
    echo "[X6728] Missing patch: ${health_patch_file}"
elif [[ ! -f "${vibration_patch_file}" ]]; then
    echo "[X6728] Missing patch: ${vibration_patch_file}"
elif ! command -v patch >/dev/null 2>&1; then
    echo "[X6728] Missing required command: patch"
elif (
    cd "${workspace_root}" &&
	patch -p1 -N --dry-run --silent < "${vibration_patch_file}" >/dev/null 2>&1
    patch -p1 -N --dry-run --silent < "${health_patch_file}" >/dev/null 2>&1
); then
    if (
        cd "${workspace_root}" &&
		patch -p1 -N --silent < "${vibration_patch_file}" >/dev/null 2>&1
        patch -p1 -N --silent < "${health_patch_file}" >/dev/null 2>&1
    ); then
        echo "[X6728] Applied patches."
    else
        echo "[X6728] Failed to apply patches."
    fi
else
    echo "[X6728] Patches already applied or not applicable"
fi

unset device_dir workspace_root patch_file