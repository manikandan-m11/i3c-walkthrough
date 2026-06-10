# MIPI I3C HCI Driver — Interactive Walkthrough

A self-contained, beginner-friendly interactive HTML walkthrough of the Linux
**MIPI I3C HCI master driver** (`drivers/i3c/master/mipi-i3c-hci/`), as brought up
on the **Microchip SAMA7D65** SoC.

It explains, graphically, the whole journey from `probe()` to slave detection
(Dynamic Address Assignment), and documents every source file and all 17
`i3c_master_controller_ops` callbacks, plus the PIO/DMA engines, the cmd_v1/cmd_v2
command models, the DAT/DCT tables, extended-capability parsing, and the
AMD + Microchip quirks.

> The page is a **prebuilt artifact**. It only needs regenerating when the HCI
> driver changes substantially.

## Contents

| Path | What it is |
|------|------------|
| `walkthrough.html` | The interactive page (open in any browser). |
| `bin/i3c-walkthrough` | Launcher: serves the page on `:8765` and opens it. Costs no tokens. |
| `claude-commands/i3c-walkthrough.md` | Claude Code user-level slash command (`/i3c-walkthrough`). |
| `install.sh` | Restores the files to their working locations on a new machine. |

## Quick view

Just open `walkthrough.html` in a browser. Or serve it:

```sh
cd $(dirname walkthrough.html) && python3 -m http.server 8765
# then browse http://localhost:8765/walkthrough.html
```

## Install on a new machine

```sh
./install.sh
```

This copies the files into place:

- `walkthrough.html` → `~/.local/share/i3c-hci/walkthrough.html`
- `bin/i3c-walkthrough` → `~/.local/bin/i3c-walkthrough` (must be on `PATH`)
- `claude-commands/i3c-walkthrough.md` → `~/.claude/commands/i3c-walkthrough.md`

Afterwards, from any terminal:

```sh
i3c-walkthrough          # serve + open the page (zero LLM tokens)
```

…or inside Claude Code: `/i3c-walkthrough`.

## Regenerating after a driver change

Open the kernel tree in Claude Code and ask:

> regenerate the i3c walkthrough

It re-reads every file under `drivers/i3c/master/mipi-i3c-hci/` and rewrites
`walkthrough.html` from scratch. Then commit the updated `walkthrough.html` here.
