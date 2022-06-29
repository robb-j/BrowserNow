# Change browser now!

Quickly change you Mac's default browser from the status bar.

![The BrowserNow menu showing safari is active and Firefox is available](/screenshot.webp)

## Install

1. Find the [latest release](https://github.com/robb-j/BrowserNow/releases)
2. Download and unzip the app
3. Drag it into your Applications folder
4. Double click it to launch

## Release

1. Ensure git is clean
2. Make sure [CHANGELOG.md](/CHANGELOG.md) is up to date
3. Update any documentation if needed
4. Bump the version and build in the xcode project
5. Commit those changes as `X.Y.Z`
6. Tag the commit as `vX.Y.Z`
7. **Product → Archive** then **Distribute app → Developer ID → ...**
8. Push the commit and tag to GitHub
9. Wait for the app to be notorized
10. Create a release from the tag, attach the notarised app and write the release notes

## Notice

Browser images are provided by [alrra/browser-logos](https://github.com/alrra/browser-logos)
which are licenced under MIT.
