# hello-java

Minimaler Java-Webservice (nur JDK, keine Frameworks) als Demo für GitHub Actions:
Push auf `main` → Tests → Docker-Image (arm64) → Deployment per SSH.

`GET /` liefert `Hello World from Java! Version: <APP_VERSION>` (Standard: `dev`).

## Lokal starten

Voraussetzungen: Java 25 (LTS) und Maven 3.8.5 oder neuer.

```bash
mvn -B verify
java -jar target/app.jar
# oder mit Docker:
docker build --build-arg APP_VERSION=local -t hello-java .
docker run -p 8080:8080 hello-java
```

Danach: <http://localhost:8080>

## Pipeline

- `.github/workflows/ci.yml`: Tests bei Pull Requests und Push auf `main`
- `.github/workflows/deploy.yml`: Build, Push nach ghcr.io und Deployment bei Push auf `main`

Benötigte Secrets: `DEPLOY_HOST`, `DEPLOY_USER`, `DEPLOY_SSH_KEY`.
