import pytest
import subprocess as sp
from pathlib import Path

srcs = Path(__file__).parent.parent.glob("src/**/*.sv")

@pytest.mark.parametrize("src", srcs)
def test_compile(src):
    build_path = Path(__file__).parent.parent / "build"
    build_path.mkdir(parents=True, exist_ok=True)
    Path(build_path / ".gitignore").write_text("*")
    result = sp.run(["verilator", "--binary", src, "-Mdir", "build/" + src.stem])
    assert result.returncode == 0

srcs = Path(__file__).parent.parent.glob("src/**/*.sv")

@pytest.mark.parametrize("src", srcs)
def test_run(src):
    result = sp.run([f"{Path(__file__).parent.parent}/build/{src.stem}/V{src.stem}"])
    assert result.returncode == 0
