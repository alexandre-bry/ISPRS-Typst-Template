# Demo
echo "Compiling template demo..."
typst compile template/main.typ template/main.pdf --root . --input anonymous=false
typst compile template/main.typ template/main-anonymous.pdf --root . --input anonymous=true

# Guidelines
echo "Compiling guidelines..."
typst compile guidelines/main.typ guidelines/main.pdf --root . --input anonymous=false
typst compile guidelines/main.typ guidelines/main-anonymous.pdf --root . --input anonymous=true

# Thumbnail
echo "Compiling thumbnail..."
typst compile -f png --pages 1 --ppi 500 template/main.typ thumbnail.png --root . --input anonymous=false
oxipng -o 4 --strip safe --alpha thumbnail.png