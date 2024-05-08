create database dblaundry_kel6;

use dblaundry_kel6;

create table pelanggan(
    id_pelanggan char(10),
    nama_pelanggan varchar(100),
    nohp varchar(15),
    alamat varchar (100),

    PRIMARY KEY (id_pelanggan)
);

create table transaksi(
    id_transaksi char(10),
    tgl_masuk DATE,
    tgl_keluar DATE,
    id_pelanggan char(10),
    berat_pakaian text,
    harga_perkilo int (20),
    status_transaksi text,

    PRIMARY KEY (id_transaksi)
);

create table harga(
    id_transaksi char(10),
    harga_perkilo int (20),

    PRIMARY KEY (id_transaksi)
);

create table pakaian(
    id_pakaian char(10),
    id_transaksi char (10),
    berat_pakaian text,

    PRIMARY KEY (id_pakaian)
);

create table transaksi_detail(
    id_transaksi char(10),
    id_pakaian char (10),
    harga_perkilo int (20),
    total_transaksi int (20),

    PRIMARY KEY (id_transaksi)
);

desc pelanggan;
desc transaksi;
desc harga;
desc pakaian;
desc transaksi_detail;

-- data utk tabel pelanggan :
-- bisa pakai cara pertama 

insert into pelanggan (id_pelanggan, nama_pelanggan, nohp, alamat) values
('KPL001', 'Cundamani', '08155431677', 'Jalan Mangga Besar'),
('KPL002', 'Jundi', '082265883994', 'Jalan Duri Kosambi'),
('KPL003', 'Satria', '085335621775', 'Jalan Kebayoran Baru'),
('KPL004', 'Asmara', '087666735442', 'Jalan Juanda Lama'),
('KPL005', 'Zaskia', '089333742618', 'Jalan Soekarno Hatta');

-- atau bisa pakai cara kedua 

insert into pelanggan values (
    "KPL001",
    "Cundamani",
    "08155431677",
    "Jalan Mangga Besar"
);

insert into pelanggan values (
    "KPL002",
    "Jundi",
    "082265883994",
    "Jalan Duri Kosambi"
);

insert into pelanggan values (
    "KPL003",
    "Satria",
    "085335621775",
    "Jalan Kebayoran Baru"
);

insert into pelanggan values (
    "KPL004",
    "Asmara",
    "087666735442",
    "Jalan Juanda Lama"
);

insert into pelanggan values (
    "KPL005",
    "Zaskia",
    "089333742618",
    "Jalan Soekarno Hatta"
);

-- data utk tabel transaksi :
-- bisa pakai cara pertama 

insert into transaksi (id_transaksi, tgl_masuk, tgl_keluar, id_pelanggan, berat_pakaian, harga_perkilo, status_transaksi) values
('TRL001', '2024-05-01', '2024-05-03', 'KPL001', '3 kg', 4000, 'Selesai'),
('TRL002', '2024-05-04', '2024-05-06', 'KPL002', '5 kg', 5000, 'Selesai'),
('TRL003', '2024-05-07', '2024-05-09', 'KPL003', '7 kg', 6000, 'Selesai'),
('TRL004', '2024-05-10', '2024-05-12', 'KPL004', '9 kg', 7000, 'Dalam Proses'),
('TRL005', '2024-05-13', '2024-05-15', 'KPL005', '11 kg', 8000, 'Dalam Proses');

-- atau bisa pakai cara kedua

insert into transaksi values (
    "TRL001",
    DATE '2024-05-01',
    DATE '2024-05-03',
    "KPL001",
    "3 kg",
    4000,
    "Selesai"
);

insert into transaksi values (
    "TRL002",
    DATE '2024-05-04',
    DATE '2024-05-06',
    "KPL002",
    "5 kg",
    5000,
    "Selesai"
);

insert into transaksi values (
    "TRL003",
    DATE '2024-05-07',
    DATE '2024-05-09',
    "KPL003",
    "7 kg",
    6000,
    "Selesai"
);

insert into transaksi values (
    "TRL004",
    DATE '2024-05-10',
    DATE '2024-05-12',
    "KPL004",
    "9 kg",
    7000,
    "Dalam Proses"
);

insert into transaksi values (
    "TRL005",
    DATE '2024-05-13',
    DATE '2024-05-15',
    "KPL005",
    "11 kg",
    8000,
    "Dalam Proses"
);

-- data utk tabel harga :
-- bisa pakai cara pertama 

insert into harga (id_transaksi, harga_perkilo) values
('TRL001', 4000),
('TRL002', 5000),
('TRL003', 6000),
('TRL004', 7000),
('TRL005', 8000);

-- atau bisa pakai cara kedua

insert into harga values (
    "TRL001",
    4000
);

insert into harga values (
    "TRL002",
    5000
);

insert into harga values (
    "TRL003",
    6000
);

insert into harga values (
    "TRL004",
    7000
);

insert into harga values (
    "TRL005",
    8000
);

-- data utk tabel pakaian :
-- bisa pakai cara pertama 

insert into pakaian (id_pakaian, id_transaksi, berat_pakaian) values
('PAL001', 'TRL001', '3 kg'),
('PL002', 'TRL002', '5 kg'),
('PL003', 'TRL003', '7 kg'),
('PL004', 'TRL004', '9 kg'),
('PL005', 'TRL005', '11 kg');

-- atau bisa pakai cara kedua 

insert into pakaian values (
    "PAL001",
    "TRL001",
    "3 kg"
);

insert into pakaian values (
    "PAL002",
    "TRL002",
    "5 kg"
);

insert into pakaian values (
    "PAL003",
    "TRL003",
    "7 kg"
);

insert into pakaian values (
    "PAL004",
    "TRL004",
    "9 kg"
);

insert into pakaian values (
    "PAL005",
    "TRL005",
    "11 kg"
);

-- data utk tabel transaksi_detail :
-- bisa pakai cara pertama 

insert into transaksi_detail (id_transaksi, id_pakaian, harga_perkilo, total_transaksi) values
('TRL001', 'PAL001', 4000, 12000),
('TRL002', 'PAL002', 5000, 25000),
('TRL003', 'PAL003', 6000, 42000),
('TRL004', 'PAL004', 7000, 56000),
('TRL005', 'PAL005', 8000, 88000);

-- atau bisa pakai cara kedua

insert into transaksi_detail values (
    "TRL001",
    "PAL001",
    4000,
    12000
);

insert into transaksi_detail values (
    "TRL002",
    "PAL002",
    5000,
    25000
);

insert into transaksi_detail values (
    "TRL003",
    "PAL003",
    6000,
    42000
);

insert into transaksi_detail values (
    "TRL004",
    "PAL004",
    7000,
    56000
);

insert into transaksi_detail values (
    "TRL005",
    "PAL005",
    8000,
    88000
);

select * from pelanggan;
select * from transaksi;
select * from harga;
select * from pakaian;
select * from transaksi_detail;