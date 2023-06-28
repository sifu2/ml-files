from typing import Optional

from fastapi import APIRouter, Response, UploadFile, Header

from src import business


api_router = APIRouter(prefix="/api", tags=["API"])


@api_router.get("/{file_uid}")
async def get_file(file_uid: str) -> Response:
    return await business.get_file(file_uid)


@api_router.post("")
async def save_file(file: UploadFile, x_secret_word: Optional[str] = Header(...)):
    return await business.save_file(file, x_secret_word)
