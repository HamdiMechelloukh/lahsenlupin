[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$imgFolder = "img"
$codeFolder = "."
$imageExtensions = @("*.png", "*.jpg", "*.jpeg", "*.gif", "*.svg")

# Liste toutes les images dans le dossier
$images = Get-ChildItem -Path $imgFolder -Recurse -Include $imageExtensions

# Récupère tous les fichiers .html, .css, .js
$codeFiles = Get-ChildItem -Path $codeFolder -Recurse -Include *.html, *.css, *.js

# Concatène le contenu des fichiers en une seule chaîne
$codeContent = ""
foreach ($file in $codeFiles) {
    $codeContent += Get-Content $file.FullName -Raw
}

# Recherche les images non référencées
$unusedImages = @()

foreach ($image in $images) {
    if ($codeContent -notmatch [regex]::Escape($image.Name)) {
        $unusedImages += $image.FullName
    }
}

# Affiche les résultats
if ($unusedImages.Count -eq 0) {
    Write-Host "✅ Toutes les images sont utilisées !"
} else {
    Write-Host "⚠️  Images non utilisées :"
    $unusedImages | ForEach-Object { Write-Host "❌ $_" }
}
