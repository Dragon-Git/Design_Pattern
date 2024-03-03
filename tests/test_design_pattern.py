import pytest
import subprocess as sp
from pathlib import Path

srcs = Path(__file__).parent.parent.glob("**/*.sv")

@pytest.mark.parametrize("src", srcs)
def test_file(src):
    print(src)
    sp.run(["make", f"SRC_FILES={src}"])
