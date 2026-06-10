#!/usr/bin/env bash
# Restore the I3C HCI walkthrough files to their working locations.
# Safe to re-run; it overwrites the installed copies with this repo's versions.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install -Dm644 "$here/walkthrough.html"              "$HOME/.local/share/i3c-hci/walkthrough.html"
install -Dm755 "$here/bin/i3c-walkthrough"           "$HOME/.local/bin/i3c-walkthrough"
install -Dm644 "$here/claude-commands/i3c-walkthrough.md" "$HOME/.claude/commands/i3c-walkthrough.md"

echo "Installed:"
echo "  ~/.local/share/i3c-hci/walkthrough.html"
echo "  ~/.local/bin/i3c-walkthrough"
echo "  ~/.claude/commands/i3c-walkthrough.md"
echo

case ":$PATH:" in
  *":$HOME/.local/bin:"*) echo "Run it from any terminal:  i3c-walkthrough" ;;
  *) echo "NOTE: ~/.local/bin is not on your PATH. Add it, e.g.:"
     echo "      echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc" ;;
esac
