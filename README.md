# Marketplace App

<div align="center">
  <img src="assets/images/ic_logo.png" alt="Marketplace Logo" width="150"/>
</div>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.7.0+-02569B?style=flat-square&logo=flutter" alt="Flutter Version" />
  <img src="https://img.shields.io/badge/Platform-Android%20|%20iOS-green.svg?style=flat-square" alt="Platform" />
  <img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square" alt="License" />
  <img src="https://img.shields.io/badge/Version-1.0.0-orange.svg?style=flat-square" alt="Version" />
</p>

Um aplicativo de marketplace completo desenvolvido com Flutter, oferecendo uma experiência de compra intuitiva e elegante para os usuários. Este aplicativo permite aos usuários navegar por produtos, fazer pedidos e acompanhar o status de suas entregas.

## 📱 Screenshots

<div align="center">
  <div style="display: flex; flex-direction: row; justify-content: center; margin-bottom: 20px">
    <img src="imagens/Captura de Tela 2025-05-24 às 18.55.09.png" width="240" style="margin-right: 20px"/>
    <img src="imagens/Captura de Tela 2025-05-24 às 18.55.25.png" width="240" style="margin-right: 20px"/>
    <img src="imagens/Captura de Tela 2025-05-24 às 18.55.33.png" width="240"/>
  </div>
  <div style="display: flex; flex-direction: row; justify-content: center;">
    <img src="imagens/Captura de Tela 2025-05-24 às 19.31.46.png" width="240" style="margin-right: 20px"/>
    <img src="imagens/Captura de Tela 2025-05-24 às 19.31.50.png" width="240" style="margin-right: 20px"/>
    <img src="imagens/Captura de Tela 2025-05-24 às 19.32.16.png" width="240"/>
  </div>
</div>

## ✨ Funcionalidades

- **Login Flexível**: Opção de login com conta ou entrada como convidado
- **Catálogo de Produtos**: Navegação intuitiva por categorias e produtos
- **Detalhes de Produtos**: Visualização detalhada com imagens, descrições e preços
- **Carrinho de Compras**: Adição e remoção de produtos com atualização em tempo real
- **Gestão de Pedidos**: Acompanhamento do status de pedidos com timeline visual
- **Histórico de Compras**: Visualização de pedidos anteriores com detalhes completos
- **Interface Responsiva**: Design adaptável a diferentes tamanhos de tela
- **Experiência Offline**: Funcionalidades básicas disponíveis mesmo sem conexão

## 🛠️ Tecnologias

- **Flutter**: Framework para desenvolvimento cross-platform
- **Dart**: Linguagem de programação
- **Flutter Modular**: Gerenciamento de rotas e injeção de dependências
- **RxDart**: Programação reativa para gestão de estado
- **Dio**: Cliente HTTP para comunicação com APIs
- **Intl**: Internacionalização e formatação
- **Flutter Secure Storage**: Armazenamento seguro de dados sensíveis
- **Shared Preferences**: Persistência de dados simples
- **Google Fonts**: Tipografia consistente
- **Flutter SVG**: Renderização de imagens vetoriais

## 🏗️ Arquitetura

O aplicativo segue uma arquitetura modular baseada no padrão BLoC (Business Logic Component), que separa a interface do usuário da lógica de negócios:

- **Modules**: Organização do código em módulos funcionais
- **Repositories**: Camada de acesso a dados e APIs
- **Models**: Representação de entidades de negócio
- **BLoCs**: Gerenciamento de estado e lógica de negócios
- **Pages/Widgets**: Componentes de interface do usuário

## 🚀 Instalação

1. **Pré-requisitos**:
   - Flutter SDK (versão 3.7.0 ou superior)
   - Dart SDK (versão compatível com o Flutter)
   - Android Studio / XCode para emuladores

2. **Clonar o repositório**:
   ```bash
   git clone https://seu-repositorio/new_marketplace_app.git
   cd new_marketplace_app
   ```

3. **Instalar dependências**:
   ```bash
   flutter pub get
   ```

4. **Executar o aplicativo**:
   ```bash
   flutter run
   ```

## 📋 Requisitos

- Flutter 3.7.0 ou superior
- Dart 2.19.0 ou superior
- iOS 11+ / Android 5.0+ (API 21+)
- Conexão com internet para funcionalidades completas

## 🔧 Configuração

1. **Variáveis de ambiente**:
   - Crie um arquivo `.env` na raiz do projeto com as seguintes variáveis:
     ```
     API_BASE_URL=https://seu-backend-api.com
     API_KEY=sua_chave_api
     ```

2. **Firebase** (opcional):
   - Adicione os arquivos `google-services.json` (Android) e `GoogleService-Info.plist` (iOS) para integração com Firebase

## 👨‍💻 Desenvolvimento

Para contribuir com o desenvolvimento:

1. Crie uma branch a partir da `main`:
   ```bash
   git checkout -b feature/nova-funcionalidade
   ```

2. Faça suas alterações seguindo o padrão de código do projeto

3. Teste suas mudanças:
   ```bash
   flutter test
   ```

4. Envie um Pull Request para revisão

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 📧 Contato

Para questões, sugestões ou feedback, entre em contato pelo email: [contato@seudominio.com](mailto:contato@seudominio.com)

---

<div align="center">
  <p>Desenvolvido com ❤️ por Sua Empresa</p>
</div>
