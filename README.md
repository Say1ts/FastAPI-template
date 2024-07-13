# What is it?
This project is a template of FastAPI project with pre-configurations:
- sqlalchemy, alembic
- poetry
- structure of files
- fastapi main.py and modules
- dockerfile

# How to use
### Pycharm
If you use Pycharm, mark src dir as Source root.
### Database
1. Configure DATABASE_URL in .env file
2. Describe your models in `src/models.py` 
3. Use alembic to autogenerate migrations: 
```sh
alembic revision --autogenerate -m "first migraition
```
4. Use alembic to apply migrations:
```sh
alembic upgrade head
```


## Linux
Prepare: (NOT CHECKED)
```sh
python -m venv .venv
source ./venv/Scripts/activate
chmod +x start.sh
```

## Install Dependencies:
### pip
Transform pyproject.toml to `requirements.txt` (if you don't have `requirements.txt` already or you need to update it)
```shell

pip install poetry
poetry export -f requirements.txt --output requirements.txt
```
```sh
pip install -r requirements.txt

```
#### poetry
```sh
pip install poetry
poetry install
poetry update
```
add new dep:
```sh
poetry add <package_name>
```
add new dev dep

```sh
poetry add --dev <package_name>

```
Launch:
```sh
./bash start.sh
```

Create Docker Image amd Launch:
```sh
./start_docker.sh
```

## Windows
Prepare:
```sh
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
```
Launch:
```sh
./start.bat
```
Create Docker Image amd Launch:
```sh
./start_docker.bat
```