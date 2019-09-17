# mksigspoofmod

`mksigspoofmod` is a proof of concept of a generator for Magisk modules that enable signature spoofing, given a fileset patched by [Haystack](https://github.com/Lanchon/Haystack) by Lanchon.

Coupled with [NanoDroid](https://github.com/Nanolx/NanoDroid) by Nanolx or with any other Magisk-based microG solution, it enables fully systemless microG support.

-----

## Requirements

To run, `zip` and `unzip` are required.

-----

## Usage

Running `mksigspoofmod` without arguments will display a brief usage message:

    Usage: mksigspoofmod fileset

Here, `fileset` refers to a directory containing a set of files patched by `Haystack`. The files expected to be present are `ext.jar`, `framework.jar`, `services.jar` and `Settings.apk`.

-----

## How it works

`mksigspoofmod` expects a `template.zip` file in its own directory. It contains the final module, sans the fileset.
The module version is irrelevant to us, and so it'll always be `v0.1.0`.

Once launched, `mksigspoofmod` tries to wipe any traces of a failed run.
Then, it extracts the template in the current directory and places the fileset parts in the appropriate locations.
Lastly, it packs the module and wipes the extracted template. At this point, the module is ready to be flashed.

**The module will be placed inside the current directory.**

-----

## Contributing

Before contributing:
 * analyze your code with `shellcheck` or `shellharden` and fix the complaints it has;
 * make sure all indentations are 4-spaces wide.

-----

## License

This project is licensed under the terms of the BSD-3-Clause license.
See the [LICENSE](LICENSE) file for details.

-----

## Credits

This project wouldn't exist without:
 * Lanchon ([Haystack](https://github.com/Lanchon/Haystack));
 * topjohnwu ([Magisk](https://github.com/topjohnwu/Magisk));
 * The microG Project ([microG](https://github.com/microg)).

If you have time, pay a look at their projects. It'll be worth your while.
