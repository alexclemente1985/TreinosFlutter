# signin_signup_logout

A new Flutter project.

# Notas de desenvolvimento

## Desenvolvimento MacOS

### Problema para conexão com API Rest

1) Ir na pasta raiz do projeto e digitar (no terminal): `open macos/Runner.xcworkspace`;

2) No Xcode, entre na pasta `Runner` e adicione pelo botão `+` no canto superior direito o atributo `Outgoing Network Connections` como `YES` nos `entitlements` de **DebugProfile** e **Release**;

3) Salvar e fechar o Xcode

4) No terminal do projeto rodar os comandos
- `flutter clean`;
- `flutter run -d macos`;

## Desenvolvimento Android

### Problema para conexão com API Rest em localhost

1) Verificar se em `android/app/src/main/AndroidManifest.xml` existe a permissão para acesso à internet; caso contrário, colocar o seguinte trecho logo após a tag inicial `<manifest>`:
- ` <uses-permission android:name="android.permission.INTERNET" />`

1) Emulador virtual:
- Colocar como `localhost` o valor `10.0.2.2`

2) Dispositivo físico:
- Conectar o dispositivo na mesma rede do computador de desenvolvimento;
- Obter o valor do IP do computador server na rede e usá-lo na url da conexão.
