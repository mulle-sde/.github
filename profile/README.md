# MulleSDE

* <b>Are you developing in C, C++ or Objective C ?</b>
* <b>Do you hate being tied to your IDE vendor ?</b>
* <b>Do you want to develop for MacOS, FreeBSD, Linux, Windows all with the same IDE ?</b>
* <b>Are you using docker to keep project dependencies separate but you are looking for something better ?</b>
* <b>Would you like your projects to build not only next year but also in the next decades ?</b>

#### Then install [mulle-sde](//github.com/mulle-sde/mulle-sde) and give it a try! 

## About

MulleSDE is an IDE and dependency (package) manager for the commandline. There are no graphical components.
Amongst a few other things it

* provides a per-project environment
* fetches remote files and place them anywhere in your project tree
* fetches and builds dependencies (archives and git repositories) recursively and installs them locally to the project or at a chose place
* creates source files from templates
* transforms file-system structure into project files
* interfaces with various build systems
* parallelizes cmake project builds
* loads build instructions for third party dependencies from github
* is scriptable and extensible

## Documentation

The [mulle-sde WiKi](//github.com/mulle-sde/mulle-sde/wiki) has some introductory and
in-depth information, that doesn't fit into the help texts of the various mulle-sde commands. 
Otherwise mulle-sde strives to be self-explanatory through help texts and file comments.


## Install

See [mulle-sde-developer](//github.com/mulle-sde/mulle-sde-developer) how
to install mulle-sde.


## Quick Start

If you want to compile some dependencies without setting up a mulle-sde project,
you can do an *install* with an archive. Here is an example where the latest *mulle-buffer*
and its dependencies is installed into `/tmp/foo`:

```
mulle-sde install --prefix /tmp/foo https://github.com/mulle-c/mulle-buffer/archive/latest.tar.gz
```

If you don't want to use the mulle-sde project management features, but would like to
keep the dependencies local to your project, you can use a `none` project type:

```
mulle-sde init none
mulle-sde dependency add --c --github mulle-c mulle-buffer
mulle-sde craft
mulle-sde linkorder
```

This will create four folders with the compiled results:

```
.
├── dependency   # the desired output
├── kitchen      # temporary build folder
├── .mulle       # internal mulle-sde maintenance
└── stash        # download dependencies
```

and it will give you the link options for your platform in the correct order:

```
-L./dependency/lib
-lmulle-buffer
-lmulle-allocator
```

## In action

<script id="asciicast-223917"
        src="https://asciinema.org/a/223917.js"
        async>
</script>


## Baby steps

These tools can be useful on their own. When you get more familiar with them,
you will get an idea what *mulle-sde* can do for you:

Tool                                                  | Description
------------------------------------------------------|-------------------------
[mulle-env](//github.com/mulle-sde/mulle-env)         | custom environments for projects
[mulle-fetch](//github.com/mulle-sde/mulle-fetch)     | grab and unpack repositories and archives
[mulle-make](//github.com/mulle-sde/mulle-make)       | detect build method and build a project
[mulle-match](//github.com/mulle-sde/mulle-match)     | categorize files and make files
[mulle-monitor](//github.com/mulle-sde/mulle-monitor) | monitor a filesystem folder and trigger commands on change
[mulle-semver](//github.com/mulle-sde/mulle-semver)   | semantic versioning support
