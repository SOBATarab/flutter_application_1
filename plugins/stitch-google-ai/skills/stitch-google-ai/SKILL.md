---
name: stitch-google-ai
description: Use when the user asks for Google Stitch, Stitch Google AI, AI UI design, high-fidelity app screens, DESIGN.md design-system handoff, or converting product ideas into interface prototypes.
---

# Stitch Google AI

Use this skill when the user wants help designing or iterating on UI with Google Stitch.

## What Stitch Is For

Stitch is a Google Labs AI design tool for creating, iterating, and collaborating on high-fidelity UI from natural language. Google's current Stitch materials describe it as an AI-native software design canvas that can use text, images, code, voice, design systems, prototypes, exports, and MCP/SDK workflows.

Useful official entry points:

- Stitch app: https://stitch.withgoogle.com/
- Google announcement: https://blog.google/innovation-and-ai/models-and-research/google-labs/stitch-ai-ui-design/
- MCP setup docs: https://stitch.withgoogle.com/docs/mcp/setup
- Stitch skills repository: https://github.com/google-labs-code/stitch-skills

## Workflow

1. Clarify the target surface only if needed: mobile, web, tablet, responsive, or a specific framework such as Flutter.
2. Convert rough product intent into a Stitch-ready prompt with:
   - screen purpose
   - primary user action
   - information hierarchy
   - visual tone
   - interaction states
   - constraints from the current app
3. For an existing codebase, inspect the current UI before proposing a Stitch prompt. Preserve navigation, terminology, colors, density, and user flows unless the user asks for a redesign.
4. If Stitch MCP tools are available in the active tool list, use them for project, screen, code, image, and design context operations.
5. If Stitch MCP tools are not available, produce a clear prompt or handoff brief the user can paste into Stitch, then implement the returned design assets/code when provided.
6. When bringing Stitch output back into code, treat it as a design reference. Rebuild it using the app's native framework and verify layout, responsiveness, accessibility, and runtime behavior.

## Flutter Handoff

For Flutter apps:

- Translate Stitch layout intent into native Flutter widgets instead of embedding exported HTML.
- Keep app state, navigation, validation, and persistence in the existing Flutter architecture.
- Use Stitch output for visual direction, spacing, hierarchy, components, and copy structure.
- Verify with Flutter analysis and tests where practical.

## DESIGN.md

When the user asks for design-system continuity, create or update a `.stitch/DESIGN.md` file that captures:

- typography scale and tone
- color roles
- component shapes
- spacing rhythm
- layout density
- interaction behavior
- brand/product voice

Keep the file semantic and descriptive so it can be reused by Stitch and coding agents.
