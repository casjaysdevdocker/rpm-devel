#!/usr/bin/env sh
# shellcheck shell=sh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202209091615-git
# @@Author           :  Jason Hempstead
# @@Contact          :  jason@casjaysdev.com
# @@License          :  LICENSE.md
# @@ReadME           :  setup.sh --help
# @@Copyright        :  Copyright: (c) 2022 Jason Hempstead, Casjays Developments
# @@Created          :  Friday, Sep 09, 2022 16:15 EDT
# @@File             :  setup.sh
# @@Description      :
# @@Changelog        :  New script
# @@TODO             :  Better documentation
# @@Other            :
# @@Resource         :
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/sh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
HOME="${USER_HOME:-$HOME}"
USER="${SUDO_USER:-$USER}"
RUN_USER="${SUDO_USER:-$USER}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set sh options

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# output version
__version() { echo "202209091615-git"; }
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
cmd_exists buildx || echo "This script requires buildx"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
BASE_DIR="$(dirname "$(realpath "$0")")"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
for d in 7 8 9; do
  [ -f "$BASE_DIR/$d/Dockerfile" ] && buildx "$BASE_DIR/$d" rpm-devel $d
done
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# End application
