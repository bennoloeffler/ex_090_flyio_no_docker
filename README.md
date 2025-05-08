# ex_090_flyio_no_docker

A project to create a random-bot chatbot interface.

## Purpose

The application provides a chatbot interface where users can input text, and the server responds with the words in a random sequence.

## Running the Application

Details to be added.

## Deployment

This project is intended to be deployed to Fly.io without using Docker, via `fly launch --no-docker`.

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
