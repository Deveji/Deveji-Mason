# Deveji Flutter App

[![Powered by Mason][mason_badge]][mason_link]

A brick that creates a Flutter app and follows the [Deveji][deveji_link] architecture.

## Getting Started 🚀

Before using the brick please read the [Mason documentation][mason_docs].

To use the brick you will need:
- [Flutter][flutter_docs] - version 3.22.0
- [Firebase CLI][firebase_cli_docs] - version 13.8.3

On MacOS you will also need:
- [CocoaPods][cocoapods] - latest version

❗**IMPORTANT**❗: The `mason make` needs to be run in an authenticated firebase terminal.
To authenticate run (if previously authenticated the `--reauth` flag is *strongly advised*):
```bash
firebase login
```

## Limitations

Firebase project id has to be between 4 and 30 characters and can only contain letters, numbers, spaces, and these characters: - ! ' "

## Logs

If the brick generation process does not finish with the last command `DONE - project generated successfully` it means that errors occurred during generation process. In the generated Flutter project there should be 2 files:
- `project-creation-debug.log` - log with output of all of the commands run in the background
- `firebase-debug.log` - log with firebase issues that occurred (generated only if there were problems)

If the brick was generated successfully, there should be no log files in the created Flutter project.

<!-- References -->

[mason_badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge
[mason_link]: https://github.com/felangel/mason
[mason_docs]: https://docs.brickhub.dev/
[deveji_link]: https://www.deveji.com
[flutter_docs]: https://docs.flutter.dev/get-started/install
[firebase_cli_docs]: https://firebase.google.com/docs/cli
[cocoapods]: https://cocoapods.org/
