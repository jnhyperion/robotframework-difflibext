import os
import sys
import shutil
from invoke import task

lib_name = "robotframework-difflibext"
src_folder_name = "DiffLibExt"


@task
def clean(_):
    shutil.rmtree("build", ignore_errors=True)
    shutil.rmtree("dist", ignore_errors=True)
    shutil.rmtree(
        os.path.join("src", f"{lib_name.replace('-', '_')}.egg-info"),
        ignore_errors=True,
    )


@task
def uninstall(ctx):
    ctx.run(f"{sys.executable} -m pip uninstall {lib_name} -y")


@task(clean)
def build(ctx):
    ctx.run(f"{sys.executable} setup.py bdist_wheel", hide="out")
    wheel_file = os.path.join("dist", os.listdir("dist")[0])
    assert wheel_file.endswith(".whl")


@task(build, uninstall)
def install(ctx):
    wheel_file = os.path.join("dist", os.listdir("dist")[0])
    ctx.run(f"{sys.executable} -m pip install {wheel_file}")


@task(install)
def test(ctx):
    ctx.run("robot tests/")


@task
def install_deps(ctx):
    ctx.run(f"{sys.executable} -m pip install -r requirements.txt", hide="both")


@task(install_deps)
def lint(ctx):
    ctx.run(f"pylint src/{src_folder_name} --disable=R,C,W0703,W0212,W1203")


@task
def style_check(ctx):
    ctx.run("black . --check --diff")


@task
def reformat_code(ctx):
    ctx.run("black .")
