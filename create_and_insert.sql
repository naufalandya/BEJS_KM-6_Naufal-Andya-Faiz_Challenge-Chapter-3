CREATE DATABASE BankAndya

CREATE TABLE nasabah (
    id_nasabah VARCHAR(100) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    tanggal_dibuat DATE NOT NULL,
    alamat TEXT,
    NIK VARCHAR(16) UNIQUE NOT NULL
);


INSERT INTO nasabah (id_nasabah, nama, tanggal_dibuat, alamat, NIK)
VALUES ('e9dffbfa-88f9-4ee1-bb78-64bb1761fdbf', 'Naufal Andya Faiz', '2024-03-19', 'Jalan suka macet No 14', '1234567890123456');

SELECT * FROM nasabah;
SELECT * FROM nasabah WHERE id_nasabah = 'e9dffbfa-88f9-4ee1-bb78-64bb1761fdbf';
SELECT * FROM nasabah WHERE NIK = '1234567890123456';

UPDATE nasabah 
SET nama = 'Nama Baru', tanggal_dibuat = '2024-03-19', alamat = 'Alamat Baru', NIK = 'NIK_baru' 
WHERE id_nasabah = 'e9dffbfa-88f9-4ee1-bb78-64bb1761fdbf';

--DELETE FROM nasabah WHERE id_nasabah = 'e9dffbfa-88f9-4ee1-bb78-64bb1761fdbf';

-- Akun

CREATE TABLE akun (
    id_akun VARCHAR(100) PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    pin VARCHAR(30) NOT NULL,
    nomor_telepon VARCHAR(50),
    saldo INTEGER NOT NULL DEFAULT 0,
    kategori VARCHAR(50),
    nasabah_id VARCHAR(100) REFERENCES nasabah(id_nasabah) ON DELETE CASCADE
);

INSERT INTO akun (id_akun, username, email, password, pin, nomor_telepon, saldo, kategori, nasabah_id)
VALUES ('9907213c-ce4d-43d1-92fc-2212924c4d5e', 'naufalandya', 'naufalandya@outlook.com', 'passwordsayarahasia', '123456', '081234567890', 50000.00, 'Siswa', 'e9dffbfa-88f9-4ee1-bb78-64bb1761fdbf');

SELECT * FROM akun;
SELECT * FROM akun WHERE id_akun = '9907213c-ce4d-43d1-92fc-2212924c4d5e';
SELECT * FROM akun WHERE email = 'naufalandya@outlook.com';

UPDATE akun 
SET username = 'naufalandya', email = 'email_baru', password = 'password_baru', 
    pin = 'pin_baru', nomor_telepon = 'nomor_telepon_baru', saldo = 20000.00, kategori = 'Bisnis'
WHERE id_akun = '9907213c-ce4d-43d1-92fc-2212924c4d5e';

--DELETE FROM akun WHERE id_akun = '9907213c-ce4d-43d1-92fc-2212924c4d5e';

-- Transaksi

CREATE TABLE transaksi (
    id_transaksi VARCHAR(100) PRIMARY KEY,
    tipe VARCHAR(50) NOT NULL,
    tanggal_transaksi DATE NOT NULL,
    total INTEGER NOT NULL,
    akun_id VARCHAR(100) REFERENCES akun(id_akun) ON DELETE CASCADE
);


INSERT INTO transaksi (id_transaksi, tipe, tanggal_transaksi, total, akun_id)
VALUES ('8bf9c1ca-91d5-4964-a502-2b0757952a4a', 'masuk', '2024-03-19', 100.00, '9907213c-ce4d-43d1-92fc-2212924c4d5e');

SELECT * FROM transaksi;
SELECT * FROM transaksi WHERE id_transaksi = '8bf9c1ca-91d5-4964-a502-2b0757952a4a';
SELECT * FROM transaksi WHERE akun_id = 'naufalandya';

UPDATE transaksi 
SET tipe = 'Debit', tanggal_transaksi = '2024-03-20', total = 200.00
WHERE id_transaksi = '8bf9c1ca-91d5-4964-a502-2b0757952a4a';

--DELETE FROM transaksi WHERE id_transaksi = '8bf9c1ca-91d5-4964-a502-2b0757952a4a';