---
description: Open the prebuilt MIPI I3C HCI driver walkthrough (regenerate only when explicitly asked)
allowed-tools: Bash(i3c-walkthrough), Bash(i3c-walkthrough --regen)
---

The user invoked the MIPI I3C HCI driver walkthrough. Arguments (may be empty): "$ARGUMENTS"

The walkthrough HTML is a PREBUILT ARTIFACT at `~/.local/share/i3c-hci/walkthrough.html`.
It is served by a launcher script on PATH. Viewing it must cost no tokens — do NOT read
the driver source or rewrite the HTML on the default path.

Decide based on the arguments:

- If the arguments contain "regen", "regenerate", "rebuild", or "from scratch":
  Rebuild the page from the CURRENT driver source. Read every file in
  `drivers/i3c/master/mipi-i3c-hci/` (core.c, hci.h, pio.c, dma.c, cmd_v1.c, cmd_v2.c,
  dat_v1.c, dct_v1.c, ext_caps.c, hci_quirks.c, hci_quirks_mchp.c) and regenerate
  `~/.local/share/i3c-hci/walkthrough.html` in the established chunked style: write a
  skeleton first, then append each section with separate Edit calls (one giant Write
  fails to complete). Keep the same beginner-friendly tone, sidebar nav, collapsible
  flow steps, and all 17 controller callbacks. Then run `i3c-walkthrough` to serve it.

- Otherwise (the default — just viewing):
  Run the launcher and report the URL it prints. Nothing else.
      i3c-walkthrough
