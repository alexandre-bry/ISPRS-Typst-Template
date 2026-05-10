from pathlib import Path
from typing import Annotated
import typer
import subprocess

app = typer.Typer()


def validate_repo_root(repo_root: Path) -> Path:
    # Check if the initial dir seems correct (look for README.md, LICENSE and typst.toml)
    required_files = ["README.md", "LICENSE", "typst.toml"]
    for filename in required_files:
        if not (repo_root / filename).exists():
            raise typer.BadParameter(f"File not found: {filename}")
    return repo_root


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
):
    validate_repo_root(repo_root)

    # Copy the necessary files
    files_to_copy = [
        "README.md",
        "LICENSE",
        "typst.toml",
        "thumbnail.png",
        "src/**",
        "template/**",
    ]
    for pattern in files_to_copy:
        for file in repo_root.glob(pattern):
            if file.is_file():
                target_file = target_dir / file.relative_to(repo_root)
                target_file.parent.mkdir(parents=True, exist_ok=True)
                target_file.write_bytes(file.read_bytes())
                print(f"Copied {file} to {target_file}")


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
