CREATE DATABASE BankAndya

CREATE TABLE nasabah (
    id_nasabah BIGSERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    tanggal_dibuat DATE NOT NULL,
    alamat TEXT,
    NIK VARCHAR(16) UNIQUE NOT NULL
);


INSERT INTO nasabah (nama, tanggal_dibuat, alamat, NIK)
VALUES ('Naufal Andya Faiz', '2024-03-19', 'Jalan suka macet No 14', '1234567890123456');

INSERT INTO nasabah (nama, tanggal_dibuat, alamat, NIK)
VALUES ('Suratno', '2024-03-20', 'Jalan Gak Pernah Dibenerin No 24', '3201010203040506');

INSERT INTO nasabah (nama, tanggal_dibuat, alamat, NIK)
VALUES ('Syauqi', '2024-03-21', 'Jalan kaki sendirian No 22', '7890650432109876');

INSERT INTO nasabah (nama, tanggal_dibuat, alamat, NIK)
VALUES ('Bambang', '2024-03-22', 'Jalan Jalan bersama dia No 07', '9876543210123456');

INSERT INTO nasabah (nama, tanggal_dibuat, alamat, NIK)
VALUES ('Endah', '2024-03-23', 'Jalan Pulau Tenggelam No 11', '4567890123456789');


SELECT * FROM nasabah;
SELECT * FROM nasabah WHERE id_nasabah = '';
SELECT * FROM nasabah WHERE NIK = '1234567890123456';

UPDATE nasabah 
SET nama = 'Nama Baru', tanggal_dibuat = '2024-03-19', alamat = 'Alamat Baru', NIK = 'NIK_baru' 
WHERE id_nasabah = 3;

--DELETE FROM nasabah WHERE id_nasabah = 1;

-- Akun

CREATE TABLE akun (
    id_akun BIGSERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    pin VARCHAR(30) NOT NULL,
    nomor_telepon VARCHAR(50),
    saldo INTEGER NOT NULL DEFAULT 0,
    kategori VARCHAR(50),
    nasabah_id INTEGER REFERENCES nasabah(id_nasabah) ON DELETE CASCADE
);

INSERT INTO akun (username, email, password, pin, nomor_telepon, saldo, kategori, nasabah_id)
VALUES ('naufalandya', 'naufalandya@outlook.com', 'passwordsayarahasia', '123456', '081234567890', 50000.00, 'Siswa', 1);

INSERT INTO akun (username, email, password, pin, nomor_telepon, saldo, kategori, nasabah_id)
VALUES ('username2', 'email2@example.com', 'password2', '654321', '081234567891', 60000.00, 'Pegawai', 2);

INSERT INTO akun (username, email, password, pin, nomor_telepon, saldo, kategori, nasabah_id)
VALUES ('username3', 'email3@example.com', 'password3', '987654', '081234567892', 70000.00, 'Pelajar', 3);

SELECT * FROM akun;
SELECT * FROM akun WHERE id_akun = '';
SELECT * FROM akun WHERE email = 'naufalandya@outlook.com';

UPDATE akun 
SET username = 'naufalandya', email = 'email_baru', password = 'password_baru', 
    pin = 'pin_baru', nomor_telepon = 'nomor_telepon_baru', saldo = 20000.00, kategori = 'Bisnis'
WHERE id_akun = 1;

--DELETE FROM akun WHERE id_akun = 1;

-- Transaksi

CREATE TABLE transaksi (
    id_transaksi BIGSERIAL PRIMARY KEY,
    tipe VARCHAR(50) NOT NULL,
    tanggal_transaksi DATE NOT NULL,
    total INTEGER NOT NULL,
    akun_id INTEGER REFERENCES akun(id_akun) ON DELETE CASCADE
);


INSERT INTO transaksi (tipe, tanggal_transaksi, total, akun_id)
VALUES ('masuk', '2024-03-19', 100.00, 1);

SELECT * FROM transaksi;
SELECT * FROM transaksi WHERE id_transaksi = 1;
SELECT * FROM transaksi WHERE akun_id = 'naufalandya';

UPDATE transaksi 
SET tipe = 'Debit', tanggal_transaksi = '2024-03-20', total = 200.00
WHERE id_transaksi = 1;

--DELETE FROM transaksi WHERE id_transaksi = 1;