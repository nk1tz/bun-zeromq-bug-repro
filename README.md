# BUN - ZEROMQ - bug reproduction

To reproduce the issue:

```bash
bun install --verbose
```

Run index.ts:

```bash
bun run index.ts
```

To run with docker-compose (This has a different failure mode, not sure if useful...):
```bash
docker-compose up
```

For MacOS 14.2.1 crash report see:
macOS-crash-report.txt

