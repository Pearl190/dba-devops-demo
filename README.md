name: Deploy SQL to DEV

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Run deployment script
        run: bash scripts/deploy.sh
        env:
          DB_USER: ${{ secrets.DB_USER }}
          DB_PASS: ${{ secrets.DB_PASS }}
          DB_CONN: ${{ secrets.DB_CONN }}
