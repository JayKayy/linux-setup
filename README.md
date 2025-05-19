# linux-setup

Automation for configuring Fedora linux. This handles the basics before installing [ML4W](https://github.com/mylinuxforwork).

## Install 
 
```
./setup.sh
```

## Testing 

To run tests use `task` with the included Taskfile.yaml. The tests run in a fedora container so some will not fully function if
they require `systemd` or filesystem access e.g. `flatpak`.

```
task -a
```

