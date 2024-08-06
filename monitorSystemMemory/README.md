Documentação Técnica do Script monitoramento_processes.sh

Descrição:
O script monitoramento_processes.sh é utilizado para monitorar e registrar os processos que mais consomem memória no sistema. 
Ele coleta informações sobre os 10 processos que mais utilizam memória, incluindo o ID do processo (PID), a porcentagem de 
memória utilizada (%MEM), o usuário que está executando o processo (USER) e o comando associado ao processo (COMMAND). 
O resultado é salvo em um arquivo com um nome único baseado na data e na hora da execução.

Propósito:
O propósito deste script é fornecer uma visão rápida dos processos que mais consomem memória no sistema, auxiliando na 
identificação de possíveis problemas de desempenho.

Funcionamento:
1. Definição do Arquivo de Saída
output_file="/caminho/para/seu/diretorio/top_processes_$(date +%Y%m%d_%H%M).txt"
Define a variável output_file com o caminho e o nome do arquivo onde os resultados serão armazenados. O nome do arquivo 
inclui a data e a hora atuais no formato YYYYMMDD_HHMM, garantindo que cada execução do script crie um arquivo único.
2. Adição de Cabeçalho Manualmente
echo "PID %MEM USER COMMAND" > "$output_file"
Adiciona um cabeçalho ao arquivo de saída para descrever as colunas: PID (ID do Processo), %MEM (Percentual de Memória Utilizada), 
USER (Usuário) e COMMAND (Comando).
3. Coleta e Registro das Informações dos Processos
ps -e -o pid,%mem,user,comm --sort=-%mem | head -n 11 >> "$output_file"
Executa o comando ps para listar todos os processos em execução (-e).
Especifica o formato de saída para incluir PID, %MEM, USER e COMMAND.
Ordena a saída pela porcentagem de memória utilizada em ordem decrescente (--sort=-%mem).
Usa head -n 11 para capturar as primeiras 11 linhas (incluindo o cabeçalho automático do comando ps).
Redireciona a saída para o arquivo definido por output_file, utilizando >> para adicionar ao arquivo existente.

Saída:
O script cria um arquivo de texto no diretório especificado, com um nome no formato top_processes_YYYYMMDD_HHMM.txt.
O arquivo contém o cabeçalho seguido pelos detalhes dos 10 processos que mais consomem memória no momento da execução.

Considerações:
- Certifique-se de que o script tem permissões de execução.
- Para agendar a execução automática do script a cada x tempo, utilize o arquivo crontab do linux.
