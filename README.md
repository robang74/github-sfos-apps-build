## Github action for building SailFish OS apps

For the available SailFish OS build target releases:

* https://hub.docker.com/r/coderus/sailfishos-platform-sdk/tags

or use `latest` to be always on the edge of the container updates.

* https://hub.docker.com/repository/docker/robang74/sailfishos-platform-sdk/tags

The last available v4.5.0.16 has a mirror image on my docker hub account. 

---

### Availability

Since v0.1.4, the examples and the scripts on this project allow to build a
great variety of project from a SFOS UI app like [Patch Manager](https://github.com/robang74/patchmanager)
or [busybox](https://github.com/robang74/sailfish-os-busybox) for SFOS which
is the most vital component of the SFOS GNU/Linux subsystem.

Hence, it is the right time to freeze the versioning in order to proved an
universal availability for those who rely on this project to build their own
RPMs for SFOS.

In order to achieve this the old-stable and the master branches are protected
by accidental writings and on the master a specific tag is set. This tag v0.1.4
is also referred by the examples to grant as much as possible to others about
the building availability. They can choose to refer to the master HEAD or to
update the version in the future editing their action files.

The development process will continue on develop branch that it will be the
default branch in such a way everyone land on this page, can access to the last
developing version but suggested to use a stable (master) or tagged (v0.1.4)
version for maximum availability.

---

### Usage

For Sailfish OS build target releases ≥ 4.1.0

```
uses: robang74/github-sfos-build@v0.1.4
with:
  release: <release>
  arch: <arch>
```

For Sailfish OS build target releases < 4.1.0 

```
uses: robang74/github-sfos-build@old-stable
with:
  release: <release>
  arch: <arch>
```

For a complete example, see [here](https://github.com/storeman-developers/harbour-storeman/tree/devel/.github/workflows).

---

### Useful cases

Three useful cases are listed here here below:

* [build on demand](examples/build-on-demand.yml)
* [build on pull](examples/build-on-pull.yml)
* [build on tags](examples/build-on-tags.yml)

Also build on tags can be run on-demand by user for test purposes but it also run when triggered by a tag set on the HEAD of the default branch. Therefore the last example includes and extend the functionality of the first one. About the *build on pull*, same story but triggered by a pull instead.

---

### Installation

Surf in the `Code` page of your Github project and then click on the `Action` button on the top menu. Click on the blue link *set up a workflow yourself*, change the filename `main.yml` in one more significative and the copy and paste into the content of one of the above examples and commit the changes.

To test your new action script, click on the `Action` button, select on the right list the script name you want to test and then on the left side click on *Run workflow*. In few seconds the workflow will start and in few minutes you will can download the results of the builing from the build script summary. 
