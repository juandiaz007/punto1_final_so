from mangum import Mangum
from fastapi import FastAPI

app = FastAPI(title="Ejemplo FastAPI + Mangum")

@app.get("/")
def root():
    return {"message": "API funcionando correctamente."}

@app.get("/api/hello")
def say_hello(name: str = "Mendez"):
    return {"message": f"Hola, {name}! Bienvenido a FastAPI en Lambda."}

handler = Mangum(app)

