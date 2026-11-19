# HAMA CODEX

iPadOS-only SwiftUI starter workspace inspired by Xcode.

- Display name: HAMA CODEX
- Bundle identifier: `com.hama.codex`
- Deployment target: iPadOS 16+
- UI: SwiftUI, dark/system appearance with red accent
- CI: GitHub Actions on macOS using XcodeGen

## Build
1. Upload these files to your GitHub repository.
2. Run **Actions → HAMA CODEX iPadOS Build → Run workflow**.
3. Download the `HAMA-CODEX-unsigned-IPA` artifact.

## Important
The workflow intentionally creates an **unsigned IPA for build testing only**. It is not installable on a normal iPad until signed with a valid Apple Developer certificate and provisioning profile. Add a signing/export workflow and required secrets before distributing an installable IPA.

The Terminal, remote build, project import, and binary editor screens in this starter are UI foundations, not full implementations. Running arbitrary shell commands directly on iPad is not supported by this SwiftUI app. A secure macOS build service is required for actual compilation and Mach-O/Dylib rebuild operations.

`FrameworkSource/` contains the original C++ framework source from the supplied ZIP, preserved as-is.
