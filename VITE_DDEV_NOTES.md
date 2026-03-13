# Vite + DDEV Notes

## What we found

The `502 Bad Gateway` on:

`https://charlies.ddev.site:3001/src/app.js`

was not caused by `config/vite.php` itself. That URL is expected from this setup:

- `config/vite.php` publishes the dev server as `https://charlies.ddev.site:3001`
- `.ddev/config.yaml` maps external HTTPS port `3001` to internal container port `3000`
- `vite.config.js` expects Vite to listen on port `3000` inside the DDEV web container

The actual problem was that Vite was running on the host machine, not inside DDEV.

## Why the 502 happened

When the browser requests:

`https://charlies.ddev.site:3001/src/app.js`

DDEV tries to forward that request to `web:3000` inside the container.

At the time of the error, nothing was listening on `3000` inside the DDEV web container, so DDEV returned `502 Bad Gateway`.

PhpStorm successfully running `vite` locally did not help, because that process was serving:

`http://localhost:3000`

on macOS, not inside the DDEV container.

## Important distinction

- Host machine Vite: `vite` in the PhpStorm terminal
- Container Vite: `ddev npm run dev` or `ddev npm exec vite -- --host 0.0.0.0 --port 3000`

This project's current Craft + DDEV config expects the container version.

## Why the other project worked

The other project had two things this one did not:

- a `package.json` script: `"dev": "vite"`
- a `.ddev/config.yaml` `web_extra_daemons` entry that automatically ran `npm install && npm run dev`

That meant DDEV both exposed the Vite port and actually started Vite inside the container.

This project originally only exposed the port. It did not start Vite in DDEV.

## About `web_extra_daemons`

`web_extra_daemons` is not required by the Craft Vite plugin.

It is only a DDEV convenience for auto-starting long-running processes when DDEV starts.

Manual operation is valid:

```bash
ddev npm run dev
```

Automatic operation is optional:

```yaml
web_extra_daemons:
  - name: vite
    command: npm install && npm run dev
    directory: /var/www/html
```

## Second issue: Rollup native module error

After starting Vite inside DDEV, a new error appeared:

`Cannot find module @rollup/rollup-linux-arm64-gnu`

This was caused by a host/container dependency mismatch.

What we confirmed:

- host machine: `Darwin arm64`
- DDEV container: `Linux aarch64`
- current `node_modules` contained `@rollup/rollup-darwin-arm64`

So `node_modules` had been installed on macOS, then reused inside Linux. Rollup needs a Linux-native package when running in DDEV.

## Fix for the Rollup error

Reinstall Node dependencies inside DDEV so `node_modules` matches the container OS:

```bash
rm -rf node_modules package-lock.json
ddev npm install
ddev npm run dev
```

## Practical rule

For this project, pick one environment for Node installs and runtime.

If Vite is meant to run in DDEV, then use DDEV consistently:

- `ddev npm install`
- `ddev npm run dev`

Avoid mixing that with host-side `npm install`, or the native packages can become incompatible again.
