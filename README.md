# project

### a collection of pd-vanilla abstractions for project management

The **project** library provides a framework to build custom GUI modules, based on a set of components that are useful in a typical live electronic music performance :

* a soundbank module
* a preset management module
* a project management abstraction
* parameter mapping modules based on a bus system
* abstractions to forward a variety of input types to the bus sytem

The basic principle is that any parameter module is exposed to the preset system, including its mapping settings, and its whole state can be saved and restored by any preset manager module.
The soundbank has its own backup system.
All soundbank and preset manager modules should be exposed to the project management abstraction, allowing to save and restore the whole project's data.

, including a soundbank module, a preset management module, parameter mapping modules based on a bus system, abstractions to forward a variety of input types to the bus sytem, project files management abstractions.

This library is a work in progress, but most of it is functional. It consists in a number of utilities to include in your patches which allow you to load and save "projects" (aka folders containing a collection of all files needed by the patch to perform a particular project).

A project folder contains files in which module presets, controller mappings and sound sample collections are stored, and is managed using the `[file-manager]` object.

The `[soundbank]` object allows to keep a collection of sounds up to date and make them available to sample based audio modules using the `[sound-selector]` object.

The `[preset-manager]` object allows to read and write module presets, thanks to the `[module-preset]`, `[parameter-simple]`, `[parameter]` (etc ...) objects which should be included in these modules.

Some other objects like `[ctlbus-from-ctlin]` and `[ctlbus-from-notein]` deal with sensor input mapping (mostly MIDI ATM, OSC to be done ...), and forwards these inputs to a general bus system which mappable parameters can listen to. Any custom control parameter (such as random generator etc) can easily be forwarded to the bus sytem, as demonstrated in the examples.

To be continued ...