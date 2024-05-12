# Deveji Flutter App

[![Powered by Mason][mason_badge]][mason_link]

A brick that creates a Flutter app and follows the [Deveji][deveji_link] architecture.

## Getting Started 🚀

Before using the brick please read the [Mason documentation][mason_docs].

To use the brick you will need:
- [Flutter][flutter_docs]
- [Mason][mason_docs]

To use the brick you will need Flutter installed. To activate the Mason package run
```bash
dart pub global activate mason_cli
```

Initialize Mason in the current workspace
```bash
mason init
```

After initialization, there should be a `mason.yaml`. Add the deveji_flutter_app brick to 
the dependencies
```yaml
bricks:
    deveji_flutter_app:
        path: ../<PATH_TO_DEVEJI_BRICK>/deveji_flutter_app
```

To use the brick run
```bash
mason get
mason make deveji_flutter_app
```

## Logs

If the brick generation process does not finish with the last command `DONE - project generated successfully` it means that errors occured during generation process. In the generated Flutter project there should be a file `project-creation-debug.log` - log with output of all of the commands run in the background.

If the brick was generated successfully, there should be no log files in the created Flutter project.

<!-- References -->

[mason_badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge
[mason_link]: https://github.com/felangel/mason
[mason_docs]: https://docs.brickhub.dev/
[deveji_link]: https://www.deveji.com
[flutter_docs]: https://docs.flutter.dev/get-started/install
