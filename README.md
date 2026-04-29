# Move it

An Aseprite extension that adds common keyboard shortcuts to nudge, push and move selected layers.

## Installation

1. Download [move-it.aseprite-extension](https://github.com/nightgrey/aseprite-move-it/releases) from the latest release.
2. Add the extension via **Edit › Preferences › Extensions › Add Extension** in Aseprite.
3. The new menus will be available under **Layer**.
4. Set your preferred key bindings in **Edit › Preferences › Keys**.
5. Enjoy!


## Menu commands

> Note: Layers are checked for editability, visibility and walked recursively. Selecting a group affects every layer inside it.

### Layer › Nudge

Moves selected layers by 1 pixel(s) in the direction of the arrow key.

| Item    | Default shortcut |
| ------- | ---------------- |
| `Left`  | `Left`           |
| `Right` | `Right`          |
| `Up`    | `Up`             |
| `Down`  | `Down`           |

### Layer › Push

Moves selected layers by 10 pixel(s) in the direction of the arrow key.

| Command | Default shortcut |
| ------- | ---------------- |
| `Left`  | `Shift+Left`     |
| `Right` | `Shift+Right`    |
| `Up`    | `Shift+Up`       |
| `Down`  | `Shift+Down`     |

### Layer › Move

Sets the position of every selected layer back to it's origin (0, 0).

| Command     | Default shortcut |
| ----------- | ---------------- |
| `To Origin` | _(unbound)_      |

## Builing

```sh
npm run build
```


Produces `move-it.aseprite-extension`, which can be installed via Aseprite's **Edit › Preferences › Extensions › Add Extension**.
