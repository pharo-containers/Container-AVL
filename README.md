# AVL

[![CI](https://github.com/pharo-containers/AVL/actions/workflows/runTests.yml/badge.svg)](https://github.com/pharo-containers/AVL/actions/workflows/runTests.yml)

AVL Tree migration from Roassal 3. A work in progress since it should be packaged to follow project conventions.

## How to install it

To install `AVL`, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```st
Metacello new
  baseline: 'ContainersAVLTree';
  repository: 'github://pharo-containers/Container-AVL:main';
  load
```

## How to depend on it

If you want to add a dependency on `linear-models` to your project, include the following lines into your baseline method:

```st
spec
  baseline: 'ContainersAVLTree'
  with: [ spec repository: 'github://pharo-containers/Container-AVL' ].
```

