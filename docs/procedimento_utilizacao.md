# Procedimento de Utilização da Aplicação

## Pré-requisitos

* Cluster Kubernetes em execução com o Ingress configurado.
* Kong configurado e integrado ao Ingress.
* Aplicação Python implantada no cluster através do ArgoCD.

## Passos

1. **Obtenha o IP do Ingress:**
   * Use o comando `kubectl get ingress` para encontrar o endereço IP do seu Ingress.

2. **Faça uma requisição para o endpoint /devops:**
   * Utilize o `curl` ou um navegador para fazer uma requisição GET para `http://<IP_DO_INGRESS>/devops`.

3. **Verifique a resposta:**
   * A resposta esperada é um JSON contendo um UUID:

     ```json
     {"uuid": "71477d86-afba-400e-8766-40bbeccdba35"}
     ```