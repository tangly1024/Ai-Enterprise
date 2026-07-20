$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$page = Join-Path $root "public/index.html"
$assets = Join-Path $root "public/assets"
$docs = Join-Path $root "docs"

if (-not (Test-Path $page)) {
  throw "Missing public/index.html"
}

$html = Get-Content -Raw -Encoding UTF8 $page

$requiredFragments = @(
  "<title>",
  "og:image",
  "hero-ai-automation.png",
  "value-trust-delivery.png",
  "id=""cost""",
  "id=""scenes""",
  "id=""modules""",
  "id=""delivery""",
  "id=""pricing""",
  "id=""contact""",
  "class=""pricing""",
  "class=""faq""",
  "data-email=",
  "URLSearchParams"
)

foreach ($fragment in $requiredFragments) {
  if ($html -notlike "*$fragment*") {
    throw "Missing required page fragment: $fragment"
  }
}

$requiredAssets = @(
  "hero-ai-automation.png",
  "value-trust-delivery.png"
)

foreach ($asset in $requiredAssets) {
  $path = Join-Path $assets $asset
  if (-not (Test-Path $path)) {
    throw "Missing asset: $asset"
  }
}

$requiredDocs = @(
  "cloudflare-pages.md",
  "landing-page-sop.md",
  "security.md"
)

foreach ($doc in $requiredDocs) {
  $path = Join-Path $docs $doc
  if (-not (Test-Path $path)) {
    throw "Missing doc: $doc"
  }
}

$forbidden = @(
  "mail@tangly1024.com",
  "dev@x3game.org",
  "sk-",
  "BEGIN PRIVATE KEY"
)

foreach ($text in $forbidden) {
  if ($html -like "*$text*") {
    throw "Forbidden text found in page source: $text"
  }
}

if ($html -notlike "*data-email=*") {
  throw "Missing obfuscated email data attribute"
}

if ($html -notlike "*og:image*") {
  throw "Missing Open Graph image metadata"
}

if ($html -notlike "*URLSearchParams*") {
  throw "Missing source tracking hook"
}

Write-Host "Landing page checks passed."
