from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def read_root():
    return {"message": "Hello from random-bot!"}

@app.get("/health")
async def health_check():
    return {"status": "ok"}

# To run this app locally (after installing uvicorn and fastapi):
# uvicorn main:app --reload
