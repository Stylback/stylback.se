Dockerfiles for development instances.

Run:

```bash
docker build -t jekyll-dev -f dev/Dockerfile .
```

From the project root directory context, run:

```bash
docker compose -f dev/compose.yml up -d --build
```