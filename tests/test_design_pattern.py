import pytest
import subprocess as sp
from pathlib import Path

srcs = Path(__file__).parent.parent.glob("**/*.sv")

@pytest.mark.parametrize("src", srcs)
def test_compile(src):
    result = sp.run(["verilator", "--binary", src, "-Mdir", src.stem + "-sim"])
    assert result.returncode == 0

srcs = Path(__file__).parent.parent.glob("**/*.sv")

@pytest.mark.parametrize("src", srcs)
def test_run(src):
    result = sp.run([f"{Path(__file__).parent.parent}/{src.stem}-sim/V{src.stem}"])
    assert result.returncode == 0
