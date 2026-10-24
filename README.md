## TemplateDevEnv
_For Kotlin see [TemplateDevEnvKt](https://github.com/CleanroomMC/TemplateDevEnvKt)_

Template workspace for modding Minecraft 1.12.2. Licensed under MIT, it is made for public use.

This template runs on **Java 25**, **Gradle 9.7.0** + **[RetroFuturaGradle](https://github.com/GTNewHorizons/RetroFuturaGradle) 2.0.3** + **Forge 14.23.5.2847**.

With **coremod and mixin support** that is easy to configure.

### NixOS (x86-64)

```sh
nix develop
./gradlew build
./gradlew runClient
```

Enable Nix's `nix-command` and `flakes` experimental features first. The committed
`flake.lock` pins the development tools; Gradle still downloads Maven dependencies
and Minecraft assets, so the first build needs internet access.

The shell provides **Java 25 for Gradle** and **Java 8 for Forge 1.12.2**. This does
not migrate Minecraft or mod bytecode to Java 25. Leave `use_modern_java_syntax`
disabled with this shell (upstream's optional Jabel mode needs a separate JDK 16).
Native graphics/audio libraries are supplied by the shell; NixOS GPU drivers come
from `/run/opengl-driver/lib`. Minecraft uses X11, so Wayland sessions need XWayland.
No global `nix-ld` configuration or hard-coded system library paths are needed.

For IntelliJ, launch the IDE from `nix develop` so it inherits `JDK8_HOME` and the
native library paths. Set its **Gradle JVM to the shell's `JAVA_HOME` (Java 25)**.
Optional: install direnv with nix-direnv and run `direnv allow` to use `.envrc`.

To refresh the pinned Nix packages: `nix flake update`. To merge template updates:

```sh
git remote add upstream https://github.com/CleanroomMC/ForgeDevEnv.git # once
git fetch upstream
git merge upstream/master
```

`build.gradle` is kept identical to upstream. The Nix-specific toolchain override
lives in `gradle/scripts/extra.gradle`; the example mod's package/configuration is
retained from this fork. If your NVIDIA driver needs the old workaround, opt in
with `__GL_THREADED_OPTIMIZATIONS=0 ./gradlew runClient` rather than forcing it for
all GPUs.

### Instructions:

1. Click `use this template` at the top.
2. Clone the repository that you have created with this template to your local machine.
3. Make sure IDEA is using Java 25 for Gradle before you sync the project. Verify this by going to IDEA's `Settings > Build, Execution, Deployment > Build Tools > Gradle > Gradle JVM`.
4. Open the project folder in IDEA. When prompted, click "Load Gradle Project" as it detects the `build.gradle`, if you weren't prompted, right-click the project's `build.gradle` in IDEA, select `Link Gradle Project`, after completion, hit `Refresh All` in the gradle tab on the right.
5. Run gradle tasks such as `runClient` and `runServer` in the IDEA gradle tab, or use the auto-imported run configurations like `1. Run Client`.

### Notes:
- Dependencies script in [gradle/scripts/dependencies.gradle](gradle/scripts/dependencies.gradle), explanations are commented in the file.
- Publishing script in [gradle/scripts/publishing.gradle](gradle/scripts/publishing.gradle).
- When writing Mixins on IntelliJ, it is advisable to use latest [MinecraftDev Fork for RetroFuturaGradle](https://github.com/eigenraven/MinecraftDev/releases).
