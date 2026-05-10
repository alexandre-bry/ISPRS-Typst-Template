from pathlib import Path
from typing import Annotated
import typer
import subprocess
import re
import tomllib
import tomli_w

app = typer.Typer()


def validate_repo_root(repo_root: Path) -> Path:
    # Check if the initial dir seems correct (look for README.md, LICENSE and typst.toml)
    required_files = ["README.md", "LICENSE", "typst.toml"]
    for filename in required_files:
        if not (repo_root / filename).exists():
            raise typer.BadParameter(f"File not found: {filename}")
    return repo_root


def validate_version(version: str) -> str:
    # Check if the version is in the correct format (e.g. 0.1.0)
    if not version.count(".") == 2 or not all(
        part.isdigit() for part in version.split(".")
    ):
        raise typer.BadParameter(
            "Version must be in the format X.Y.Z where X, Y and Z are integers"
        )
    return version


@app.command(
    "copy_files",
    help="Copy the necessary files from the initial directory to the target directory",
)
def copy_files(
    repo_root: Annotated[
        Path,
        typer.Argument(
            help="The initial directory containing the files to copy",
            exists=True,
            file_okay=False,
            dir_okay=True,
        ),
    ],
    target_dir: Annotated[
        Path,
        typer.Argument(
            help="The target directory where the files will be copied",
            exists=True,
            file_okay=False,
            dir_okay=True,
        ),
    ],
    version: Annotated[
        str,
        typer.Argument(help="The version of the package to use in the copied files"),
    ],
):
    validate_repo_root(repo_root)
    validate_version(version)

    # Copy the necessary files
    files_to_copy = [
        "README.md",
        "LICENSE",
        "thumbnail.png",
        "src/**",
        "template/**",
        "comparison/**",
    ]
    for pattern in files_to_copy:
        for file in repo_root.glob(pattern):
            if file.is_file():
                # If the file is a Typst file, replace the regex "@local/magic-isprs:<version>" with the actual package "@preview/magic-isprs:{version}"
                target_file = target_dir / file.relative_to(repo_root)
                target_file.parent.mkdir(parents=True, exist_ok=True)
                if file.suffix == ".typ":
                    content = file.read_text()

                    content = re.sub(
                        r"@local/magic-isprs:\d+\.\d+\.\d+",
                        f"@preview/magic-isprs:{version}",
                        content,
                    )
                    target_file.write_text(content)

                else:
                    target_file.write_bytes(file.read_bytes())
                print(f"Copied {file} to {target_file}")

    # Copy typst.toml with the version updated
    typst_toml = repo_root / "typst.toml"
    if typst_toml.exists():
        with typst_toml.open("rb") as f:
            config = tomllib.load(f)

        config["package"]["version"] = version

        target_typst_toml = target_dir / "typst.toml"
        with target_typst_toml.open("wb") as f:
            tomli_w.dump(config, f)

        print(f"Copied {typst_toml} to {target_typst_toml} with version {version}")


@app.command(
    "render_pdfs",
    help="Render the PDFs from the Typst files",
)
def render_pdfs(
    repo_root: Annotated[
        Path,
        typer.Argument(
            help="The initial directory containing the Typst files",
            exists=True,
            file_okay=False,
            dir_okay=True,
        ),
    ],
):
    validate_repo_root(repo_root)

    # Render the PDFs
    typst_files = [
        repo_root / "guidelines" / "main.typ",
        repo_root / "template" / "main.typ",
    ]
    for typst_file in typst_files:
        if typst_file.exists():
            output_pdf = typst_file.with_suffix(".pdf")
            output_anonymous_pdf = typst_file.with_name(
                typst_file.stem + "-anonymous.pdf"
            )
            print(
                f"Rendering {typst_file} to {output_pdf} and {output_anonymous_pdf}..."
            )
            # Use the typst CLI to render the PDFs
            subprocess.run(
                [
                    "typst",
                    "compile",
                    str(typst_file),
                    str(output_pdf),
                    "--root",
                    str(repo_root),
                    "--input",
                    "anonymous=false",
                ]
            )
            subprocess.run(
                [
                    "typst",
                    "compile",
                    str(typst_file),
                    str(output_anonymous_pdf),
                    "--root",
                    str(repo_root),
                    "--input",
                    "anonymous=true",
                ]
            )

        else:
            print(f"Typst file not found: {typst_file}")


@app.command(
    "render_thumbnail",
    help="Render the thumbnail from the Typst file",
)
def render_thumbnail(
    repo_root: Annotated[
        Path,
        typer.Argument(
            help="The initial directory containing the Typst files",
            exists=True,
            file_okay=False,
            dir_okay=True,
        ),
    ],
):
    validate_repo_root(repo_root)

    # Render the thumbnail
    typst_file = repo_root / "template" / "main.typ"
    output_thumbnail = repo_root / "thumbnail.png"
    if typst_file.exists():
        print(f"Rendering thumbnail from {typst_file} to {output_thumbnail}...")
        subprocess.run(
            [
                "typst",
                "compile",
                str(typst_file),
                str(output_thumbnail),
                "--root",
                str(repo_root),
                "--input",
                "anonymous=false",
                "--format",
                "png",
                "--pages",
                "1",
                "--ppi",
                "500",
            ]
        )

        subprocess.run(
            [
                "oxipng",
                "-o",
                "4",
                "--strip",
                "safe",
                "--alpha",
                str(output_thumbnail),
            ]
        )
    else:
        print(f"Typst file not found: {typst_file}")


@app.command(
    "update_all",
    help="Run all the necessary steps to update the template (render PDFs and thumbnail)",
)
def update_all(
    repo_root: Annotated[
        Path,
        typer.Argument(
            help="The initial directory containing the Typst files",
            exists=True,
            file_okay=False,
            dir_okay=True,
        ),
    ],
):
    validate_repo_root(repo_root)
    render_pdfs(repo_root)
    render_thumbnail(repo_root)


if __name__ == "__main__":
    app()
