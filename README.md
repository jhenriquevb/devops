# DevOps na Prática — Fase 1 & 2

Projeto acadêmico de DevOps com CI/CD, containerização e Infraestrutura como Código na AWS.

## Stack

- **Aplicação:** Python 3.11 + Flask
- **CI/CD:** GitHub Actions (lint, testes, segurança, build Docker, deploy)
- **Containers:** Docker + Docker Compose
- **IaC:** Terraform
- **Cloud:** AWS (EC2, VPC, Security Group)
- **Registry:** GitHub Container Registry (GHCR)

## Como rodar localmente

### Sem Docker

```bash
pip install -r app/requirements.txt
python app/app.py
```

### Com Docker Compose

```bash
docker compose up --build
```

A aplicação estará disponível em `http://localhost:5000`.

## Como rodar os testes

```bash
pytest app/tests/ -v --cov=app
```

Ou via Docker (stage de testes):

```bash
docker build --target test -t devops-fase1-test .
```

## Como provisionar a infraestrutura

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

A instância EC2 já será provisionada com Docker instalado, pronta para receber deploy via container.

## Pipeline CI/CD

O pipeline é acionado em push para `main`/`develop` e PRs para `main`:

1. **Lint e Testes** — flake8 + pytest com cobertura
2. **Segurança** — análise com Bandit
3. **Build e Push** — imagem Docker enviada ao GHCR (apenas `main`)
4. **Deploy** — atualização automática do container na EC2 via SSH (apenas `main`)

## Secrets necessários no GitHub

| Secret | Descrição |
|--------|-----------|
| `EC2_HOST` | IP público da instância EC2 |
| `EC2_SSH_KEY` | Chave privada SSH para acesso à EC2 |
| `GHCR_TOKEN` | Token de acesso ao GitHub Container Registry |
