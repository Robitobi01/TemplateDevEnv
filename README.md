# TemplateDevEnv

Minecraft 1.12.2 · NixOS · Cleanroom 0.7.12-alpha · Java 25 · Gradle 9.8.1

```sh
nix develop
./gradlew build
./gradlew runClient
```

Use Java 25 for the project and Gradle JVM. Run `runClient` from the Gradle
tool window.

No longer compatible with Java 8 Forge.


Settings: `gradle.properties`. Install `build/libs/<mod_id>-<mod_version>.jar`.

Upstream: [CleanroomModTemplate](https://github.com/CleanroomMC/CleanroomModTemplate).
