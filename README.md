# linux-setup

## Install

```bash
task install
```

## Testing

```bash
task test
```

Run the test using `task test`. The tests run in a fedora
 container so some will not fully function if they require
 `systemd` or filesystem access e.g. `flatpak`.
