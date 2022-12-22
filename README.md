<div align="center">
  <h1>medicamina</h1>
  <i>Open source precision medicine.</i>
</div>

<br />

<div align="center">

  [![medicamina banner](https://raw.githubusercontent.com/medicamina/medicamina/main/docs/banner.png)](https://github.com/medicamina)

</div>

## Mission statement

🧬 Our goal is to bring easy to read genetic data to mass market

🖥 On iOS, Android and Web

💊 To help make intelligent therapeutic decisions and avoid misdiagnosis

👩‍⚕️ Designed for physicians and non professionals

📖 So you can learn about drugs and diseases

🌎 View an ancestry map, build your family history

🤧 And discover inherited diseases

## Project 

🔨 Built with these awesome tools

<br />

<div align="center">
  <a href="https://flutter.dev"><img src="https://raw.githubusercontent.com/medicamina/medicamina/main/docs/flutter.png" width="200" /></a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="https://supabase.com"><img src="https://raw.githubusercontent.com/medicamina/medicamina/main/docs/supabase.png" width="270" /></a>
</div>


## Development

### Run (macOS)

##### supabase (docker)

```bash
open -a Docker && ping -i 120 -c 2 google.com > /dev/null && cd ./src/api && docker-compose up -d && cd ../..
```


##### flutter

```bash
cd ./src/ui/ && flutter create . && flutter run
````

### Networking permissions

![https://docs.flutter.dev/development/data-and-backend/networking#platform-notes](https://docs.flutter.dev/development/data-and-backend/networking#platform-notes)

### Rename

```bash
flutter pub global activate rename
flutter pub global run rename --appname "medicamina"
```
