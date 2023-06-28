from pydantic import BaseModel


class CreateFileOut(BaseModel):
    file_name: str


class FileExistsOut(BaseModel):
    exists: bool
