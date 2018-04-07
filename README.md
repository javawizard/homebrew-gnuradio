# homebrew-gnuradio

This is a collection of [Homebrew](https://github.com/mxcl/homebrew) formulas
that makes it easier get GNURadio from source running on OS X.

## Installation

These steps have been tested on macOS Sierra (10.12).

This formula is depend on tap [cartr/qt4](https://github.com/cartr/homebrew-qt4) and shuold tap it before installation.

```bash
$ brew tap cartr/qt4
$ brew tap ttrftech/gnuradio
$ brew install ttrftech/gnuradio/gnuradio --with-qt --with-pygtk
```

## Acknowledgement

GNURadio formula is based on rixon's one[1], which is derived from Homebrew's formula[2], and merging in some customizations from other formulas, like from Titanous[3] and Metacollin[4].

- [1] https://github.com/rixon/homebrew-gnuradio/
- [2] https://github.com/Homebrew/homebrew-core/blob/master/Formula/gnuradio.rb
- [3] https://github.com/titanous/homebrew-gnuradio
- [4] https://github.com/metacollin/homebrew-gnuradio
