# ex_090_flyio_no_docker

A project to create a random-bot chatbot interface.

## Purpose

The application provides a chatbot interface where users can input text, and the server responds with the words in a random sequence.

## Running the Application Locally

1.  Ensure you have completed the steps in the **Development > Setup** section below (virtual environment activated, dependencies installed).
2.  Start the development server:
    ```bash
    uvicorn main:app --reload
    ```
3.  Open your browser and navigate to `http://127.0.0.1:8000` or `http://127.0.0.1:8000/health`.

## Deployment to Fly.io

This project is intended to be deployed to Fly.io without using Docker.

1.  **Log in to Fly.io:**
    ```bash
    fly auth login
    ```
2.  **Generate `requirements.txt`:** Before your first deployment and whenever you update dependencies, generate/update `requirements.txt`:
    ```bash
    uv pip compile pyproject.toml -o requirements.txt
    ```
    Commit this file to your repository.
3.  **Launch the app (first time):**
    ```bash
    fly launch
    ```
    Follow the prompts. Fly.io will attempt to detect your Python application type (e.g., FastAPI, Flask) and use buildpacks to prepare it if no `Dockerfile` is present. It will also guide you through selecting an app name, region, and other settings, and should create a `fly.toml` file.
4.  **Deploy changes:**
    ```bash
    fly deploy
    ```

## Development

### Prerequisites

- Python >=3.10
- `uv` for package management

### Setup

1.  **Create and activate a virtual environment:**
    ```bash
    uv venv
    source .venv/bin/activate
    ```
2.  **Install dependencies:**
    ```bash
    uv sync
    ```

### Running Tests

To run tests once:
```bash
uv run pytest
```

To run tests continuously (watching for changes):
```bash
./run_and_watch_tests.sh
```

Ensure `ptw` (pytest-watch) is installed if you use the watch script. If not, you can add it with `uv add pytest-watch --dev`.
