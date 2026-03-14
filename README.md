# DevOps na Prática — Fase 1

Projeto acadêmico de DevOps com CI/CD e Infraestrutura como Código na AWS.

## Stack

- **Aplicação:** Python 3.11 + Flask
- **CI:** GitHub Actions
- **IaC:** Terraform
- **Cloud:** AWS (EC2, VPC, Security Group)

## Como rodar localmente

```bash
pip install -r app/requirements.txt
python app/app.py
```

## Como rodar os testes

```bash
pytest app/tests/ -v --cov=app
```

## Como provisionar a infraestrutura

```bash
cd terraform
terraform init
terraform plan
terraform apply
```
