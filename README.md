# Guia de Instalação - NS-3.39 com OFSwitch13

Este repositório contém um ambiente Docker pré-configurado para executar o NS-3.39 com o módulo OFSwitch13, facilitando o desenvolvimento e testes de redes definidas por software (SDN) com OpenFlow 1.3.

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- **Docker Desktop** (Windows/Mac) ou **Docker Engine** (Linux)
  - Windows: [Download Docker Desktop](https://www.docker.com/products/docker-desktop)
  - Linux: [Instruções de instalação](https://docs.docker.com/engine/install/)
- Pelo menos **4GB de RAM** disponível para o container
- Aproximadamente **15GB de espaço em disco**

## 🚀 Instalação

### 1. Clone ou baixe este repositório

```bash
git clone <URL_DO_SEU_REPOSITORIO>
cd ns3.39
```

Ou baixe o arquivo ZIP e extraia em uma pasta de sua preferência.

### 2. Construa a imagem Docker

No diretório onde está o `Dockerfile`, execute:

```bash
docker build -t ns3-ofswitch13:latest .
```

⏱️ **Atenção**: Este processo pode levar de 15 a 30 minutos dependendo da sua conexão e hardware.

### 3. Verifique se a imagem foi criada

```bash
docker images
```

Você deverá ver a imagem `ns3-ofswitch13` listada.

## 🎯 Como Usar

### Iniciando o container

Para iniciar um container e acessar o ambiente NS-3:

```bash
docker run -it --name ns3-container ns3-ofswitch13:latest /bin/bash
```

Você estará dentro do container no diretório `/usr/ns-3-dev`.

### Executando exemplos do NS-3

Dentro do container, você pode executar exemplos:

```bash
# Exemplo básico do NS-3
./ns3 run first

# Exemplo do OFSwitch13
./ns3 run ofswitch13-simple

# Listar todos os exemplos disponíveis
./ns3 run --list
```

### Executando seus próprios scripts

Para trabalhar com seus próprios scripts, você pode:

1. **Copiar arquivos para o container**:
   ```bash
   docker cp meu-script.cc ns3-container:/usr/ns-3-dev/scratch/
   ```

2. **Ou usar volumes ao iniciar o container**:
   ```bash
   docker run -it -v C:\caminho\para\seus\scripts:/usr/ns-3-dev/scratch ns3-ofswitch13:latest /bin/bash
   ```

3. **Compilar e executar**:
   ```bash
   ./ns3 build
   ./ns3 run scratch/meu-script
   ```

## 📚 Comandos Úteis

### Gerenciamento de containers

```bash
# Listar containers em execução
docker ps

# Listar todos os containers (incluindo parados)
docker ps -a

# Parar o container
docker stop ns3-container

# Reiniciar o container
docker start ns3-container

# Reconectar ao container em execução
docker exec -it ns3-container /bin/bash

# Remover o container
docker rm ns3-container
```

### Comandos do NS-3

```bash
# Reconfigurar o NS-3
./ns3 configure --enable-examples --enable-tests

# Compilar o NS-3
./ns3 build

# Limpar compilações anteriores
./ns3 clean

# Executar testes
./ns3 run test-runner

# Obter ajuda
./ns3 --help
```

## 📁 Estrutura do Ambiente

```
/usr/ns-3-dev/
├── build/           # Arquivos compilados
├── contrib/         # Módulos contribuídos (inclui ofswitch13)
├── examples/        # Exemplos oficiais do NS-3
├── scratch/         # Seus scripts personalizados (coloque aqui!)
├── src/             # Código fonte dos módulos do NS-3
└── ns3              # Script de compilação e execução
```

## 🔧 Solução de Problemas

### Container não inicia
- Verifique se o Docker está em execução
- Certifique-se de ter recursos suficientes (RAM/CPU)

### Erro de compilação
```bash
# Limpe e recompile
./ns3 clean
./ns3 configure --enable-examples --enable-tests
./ns3 build
```

### Perdi meus arquivos ao reiniciar o container
- Use volumes do Docker para persistir dados
- Ou faça backup copiando arquivos com `docker cp`

## 📖 Recursos Adicionais

- [Documentação oficial NS-3](https://www.nsnam.org/documentation/)
- [Wiki do OFSwitch13](https://github.com/ljerezchaves/ofswitch13/wiki)
- [Tutorial NS-3](https://www.nsnam.org/docs/tutorial/html/)
- [Manual NS-3](https://www.nsnam.org/docs/manual/html/)

## 🆘 Suporte

Se encontrar problemas:
1. Verifique a seção de Solução de Problemas acima
2. Consulte a documentação oficial
3. Entre em contato com o professor ou monitores da disciplina

## ⚙️ Especificações Técnicas

- **Base**: Ubuntu 20.04
- **NS-3**: Versão 3.39
- **OFSwitch13**: Versão 5.2.2
- **Python**: 3.x
- **Compilador**: GCC/G++ e Clang

## 📝 Notas Importantes

- O primeiro build após criar o container já está pronto para uso
- Mantenha seus scripts importantes em um backup fora do container
- Para projetos maiores, considere usar volumes Docker para facilitar o desenvolvimento

---

**Bons estudos! 🎓**