# Source before tools/check.sh on this macOS host. The shim does NOT sandbox; a sandboxed Comparator run needs a Linux host (landrun + systemd-run).
export COMPARATOR_LANDRUN="$HOME/Claude/projects/comparator/scripts/fake-landrun.sh"
