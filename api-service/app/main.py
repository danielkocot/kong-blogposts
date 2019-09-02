from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/api/service1")
def read_service1():
    return {"status_code": 200, "message": "service1 is called"}

@app.get("/api/service2")
def read_service2():
    return {"status_code": 200, "message": "service2 is called"}