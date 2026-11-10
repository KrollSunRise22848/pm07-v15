# ПМ.07, вариант 15, прокат оборудования

Учебная практика по профессиональному модулю ПМ.07 Соадминистрирование и автоматизация баз данных и серверов.

## Среда

- ОС: Ubuntu 22.04, WSL2 на Windows 11
- СУБД: MySQL 8.0.46
- база: pm07_v15, проверочная: pm07_v15_restore
- таблицы: equipment, contracts, returns, служебная access_probe

## Файлы

- input.sql — учебные данные варианта
- roles.sql — создание баз, трёх учётных записей и выдача прав, пароли заглушками
- run.sh — рабочий скрипт операции mysqlcheck по расписанию
- run-timer.sh — копия скрипта с замером длительности в миллисекундах
- config.example.env — пример конфигурации без пароля
- manual.sql — ручная полная копия базы
- rows-before.txt, rows-after.txt — контрольные значения до и после восстановления
- logs/run.log — журнал запусков
- crontab.txt — экспорт расписания

## Запуск

1. Создать профиль клиента auth/client.cnf с логином admin, паролем и адресом.
2. Права: chmod 600 auth/client.cnf.
3. Скопировать config.example.env в config.env.
4. Выполнить bash ./run.sh, проверить код через echo $? и файл out/mysqlcheck.txt.

## Расписание

Постоянная запись cron:

    0 3 * * * /bin/bash "$HOME/pm07/run.sh" >> "$HOME/pm07/logs/cron.log" 2>&1

## Ожидаемый результат

Код 0, в журнале записи START, check completed, END result=OK, в out/mysqlcheck.txt четыре строки со статусом OK.
