from fastapi import FastAPI

from config import AppSettings
from src import business, api_router

settings = AppSettings()
app = FastAPI(title=settings.app_title, openapi_url=settings.schema_path)

app.include_router(api_router)


@app.on_event("startup")
async def startup_event():
    business.check_app_dirs()
    business.create_dirs()
