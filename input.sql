-- Учебные данные для варианта 15 «Прокат оборудования» (ПМ.07).
-- ВНИМАНИЕ: это локальная заглушка, чтобы начать работу.
-- Официальный файл variant-15.sql берите в карточке варианта в LMS:
-- структура и значения там могут отличаться, контрольные величины те же.
-- В каждой предметной таблице 4 строки, SUM(id)=10, SUM(amount)=100.

DROP TABLE IF EXISTS returns;
DROP TABLE IF EXISTS contracts;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS access_probe;

CREATE TABLE equipment (
  id         INT           NOT NULL,
  name       VARCHAR(120)  NOT NULL,
  event_at   DATETIME      NOT NULL,
  amount     DECIMAL(10,2) NOT NULL,
  link_id    INT           NULL,
  quantity   INT           NOT NULL,
  expires_on DATE          NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE contracts (
  id         INT           NOT NULL,
  name       VARCHAR(120)  NOT NULL,
  event_at   DATETIME      NOT NULL,
  amount     DECIMAL(10,2) NOT NULL,
  link_id    INT           NULL,
  quantity   INT           NOT NULL,
  expires_on DATE          NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE returns (
  id         INT           NOT NULL,
  name       VARCHAR(120)  NOT NULL,
  event_at   DATETIME      NOT NULL,
  amount     DECIMAL(10,2) NOT NULL,
  link_id    INT           NULL,
  quantity   INT           NOT NULL,
  expires_on DATE          NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- служебная таблица только для проверки прав
CREATE TABLE access_probe (
  id    INT NOT NULL,
  value INT NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO equipment VALUES
 (1, 'Перфоратор Makita HR2470',    '2026-11-01 09:00:00', 20.00, NULL, 1, '2027-04-30'),
 (2, 'Строительные леса, комплект', '2026-11-02 10:30:00', 25.00, NULL, 2, '2027-10-31'),
 (3, 'Генератор Huter DN6500',      '2026-11-03 08:15:00', 30.00, NULL, 1, '2027-06-30'),
 (4, 'Компрессор Fubag IR 50',      '2026-11-04 12:00:00', 25.00, NULL, 1, '2027-03-31');

INSERT INTO contracts VALUES
 (1, 'Договор 15-01, ООО Стройбаза',    '2026-11-01 09:10:00', 20.00, 1, 1, '2026-11-10'),
 (2, 'Договор 15-02, ИП Ковалев',       '2026-11-02 10:40:00', 25.00, 2, 2, '2026-11-15'),
 (3, 'Договор 15-03, ООО Монтаж-Сервис','2026-11-03 08:20:00', 30.00, 3, 1, '2026-11-12'),
 (4, 'Договор 15-04, ООО Ремонт Плюс',  '2026-11-04 12:05:00', 25.00, 4, 1, '2026-11-20');

INSERT INTO returns VALUES
 (1, 'Возврат по договору 15-01', '2026-11-05 09:00:00', 20.00, 1, 1, '2026-11-10'),
 (2, 'Возврат по договору 15-02', '2026-11-06 11:00:00', 25.00, 2, 2, '2026-11-15'),
 (3, 'Возврат по договору 15-03', '2026-11-07 08:30:00', 30.00, 3, 1, '2026-11-12'),
 (4, 'Возврат по договору 15-04', '2026-11-08 12:30:00', 25.00, 4, 1, '2026-11-20');

INSERT INTO access_probe VALUES (1, 10);
