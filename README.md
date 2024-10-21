# Инфраструктура Yandex Cloud с Terraform

Данная конфигурация Terraform создает виртуальную сеть (VPC) в Yandex Cloud, с подсетями в трех зонах доступности, нат-шлюзом, таблицей маршрутизации, привязкой таблицы маршрутизации к подсетям и группой безопасности с правилами файервола.

## Ресурсы

### VPC (Virtual Private Cloud)
- **Network**: Создается виртуальная сеть для изоляции ресурсов.

### Subnets
- **Подсети**: Создаются три подсети в различных зонах доступности Yandex Cloud:
  - `ru-central1-a`
  - `ru-central1-b`
  - `ru-central1-d`
  
  Эти подсети настроены для обеспечения высокой доступности и отказоустойчивости.

### Gateway
- **Нат-Шлюз**: Создается интернет-шлюз для доступа к интернету ресурсов внутри подсетей.

### Route Table
- **Таблица маршрутизации**: Создается пользовательская таблица маршрутизации, которая направляет трафик через интернет-шлюз.

### Привязка таблицы маршрутизации
- Таблица маршрутизации привязывается ко всем подсетям для обеспечения исходящего трафика через нат-шлюз.

### Security Group
- **Группа безопасности**: Создается группа безопасности с правилами файервола для управления входящим и исходящим трафиком.

## Структура файлов Terraform

- **`main.tf`**: Содержит основные ресурсы, такие как VPC, подсети, шлюз и таблица маршрутизации.
- **`versions.tf`**: Определение и подключение к провайдеру Yandex Cloud.
- **`variables.tf`**: Определяет входные переменные для настройки проекта, такие как CIDR блоки, регион и зоны доступности.
- **`outputs.tf`**: Определяет выходные параметры проекта, такие как идентификаторы подсетей, таблицы маршрутизации и группы безопасности.
- **`.env_tf`**: Этот файл предназначен для настройки переменных окружения, необходимых для работы с Terraform и Yandex Cloud.


## Запуск проекта
Эта инструкция шаг за шагом объясняет, как запустить проект, начиная с установки необходимых инструментов и заканчивая развертыванием инфраструктуры.

### Шаг 1: Установите Terraform CLI

1. Скачайте и установите Terraform с [официального сайта Terraform](https://www.terraform.io/downloads.html).
2. Убедитесь, что Terraform установлен, выполнив команду:

   terraform -version


### Шаг 2: Установите Yandex Cloud CLI

1. Установите Yandex Cloud CLI (yc) согласно документации Yandex Cloud.
2. Проверьте установку, выполнив команду:

    yc --version


### Шаг 3: Настройте Yandex Cloud CLI

Выполните команду для настройки yc:

    yc init


### Шаг 4: Настройте переменные окружения

Введите необходимые команды из файла .env_tf


### Шаг 5: Склонируйте проект

Скачайте или клонируйте репозиторий с проектом:

    git clone https://github.com/Zen-Crow/vpc-3-availability_zones.git

    cd vpc-3-availability_zones/


### Шаг 6: Инициализируйте Terraform

    terraform init


### Шаг 7: Создайте план развертывания

    terraform plan


### Шаг 8: Примените конфигурацию

    terraform apply

Подтвердите выполнение, введя yes.



### Для удаления всех созданных ресурсов выполните команду:

    terraform destroy


