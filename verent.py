from os import stat
import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="verent"
)
cur=mydb.cursor()

def tk():
    namak = input("Masukan Nama kendaraan\n")
    plat = input("Masukan Plat kendaraan\n")
    jenis = input("Masukan Jenis kendaraan\n")
    harga = input("Masukan Harga kendaraan\n")
    while True:
        print("\n1. Tersedia\n2. Tidak Tersedia")
        pil = input("-->Masukan pilihan")
        if pil == '1':
            stat = "Tersedia"
            break
        elif pil == '2':
            stat = "Tidak Tersedia"
            break
    cur.execute("INSERT INTO kendaraan (namak, plat, jenis, harga, stat) VALUES (%s,%s,%s,%s,%s)",(namak,plat,jenis,harga,stat))
    mydb.commit()
    print("Data tersimpan...")

def update():
    while True:
        id = input("Masukan ID ")
        print("\n1. Nama Kendaraan\n2. Plat kendaraan\n3. Jenis kendaraan\n4. Harga kendaraan\n5. Status Kendaraan\n")
        pil = input("-->Masukan pilihan Update")
        if pil == '1':
            nt = "namak"
            val = input("Masukan Nama Baru")
            break
        elif pil == '2':
            nt = "plat"
            val = input("Masukan Plat Baru")
            break
        elif pil == '3':
            nt = "jenis"
            val = input("Masukan Jenis Baru")
            break
        elif pil == '4':
            nt = "harga"
            val = int(input("Masukan Harga Baru"))
            break
        elif pil == '5':
            while True:
                print("\n1. Tersedia\n2. Tidak Tersedia")
                pil = input("-->Masukan pilihan")
                nt = "stat"
                if pil == '1':
                    val = "Tersedia"
                    break
                elif pil == '2':
                    val = "Tidak Tersedia"
                    break
    cur.execute(f"UPDATE kendaraan SET {nt}='{val}' WHERE namak='{id}'")
    mydb.commit()
    print("Data tersimpan...")

def sewa():
    nama = input("Masukan Nama Penyewa\n")
    noktp = input("Masukan NO KTP\n")
    nohp = input("Masukan NO HP\n")
    kd_k = input("Masukan Kode Kendaraan\n")
    durasi = int(input("Masukan Durasi Sewa /jam\n"))
    stat = "Tidak Tersedia"
    cur.execute("INSERT INTO sewa (nama, noktp, nohp, kd_k, durasi, status) VALUES (%s,%s,%s,%s,%s,%s)",(nama, noktp, nohp, kd_k, durasi, stat))
    mydb.commit()

def pengembalian():
    kd_k = input("Masukan Kode Kendaraan\n")
    stat = "Tersedia"
    cur.execute("INSERT INTO pengembalian (kd_k, status) VALUES (%s,%s)",(kd_k, stat))
    mydb.commit()

def tampilk():
    cur.execute("select * from kendaraan")
    db = cur.fetchall()
    print("="*39,"Daftar  Kendaraan","="*39)
    print('|\t ID\t Nama    \t Plat\t\t Jenis\t Harga      \t Status      \t\t|')
    print('-'*97)
    for row in db:
        print('|\t',row[0],'\t',row[1],'    \t',row[2],'\t',row[3],'\t',row[4],'  \t',row[5],'      \t|')
    print('='*97)

def tampils():
    cur.execute("select nama,kd_k from sewa")
    db = cur.fetchall()
    for row in db:
        print (row)

print('='*10,"Selamat Datang di VeRent",'='*10)
while True:
        print("\nMenu Utama")
        print("1. Tambah Kendaraan")
        print("2. Edit")
        print("3. Sewa Kendaraan")
        print("4. Pengembalian")
        print("5. Tampilkan Kendaraan")
        print("6. Tampilkan Penyewa")
        print("0. Keluar")
        pilihan = input("\n-->Masukan Pilihan : ")
        if pilihan == '1':
            tk()
        elif pilihan == '2':
            update()
        elif pilihan == '3':
            sewa()
        elif pilihan == '4':
            pengembalian()
        elif pilihan == '5':
            tampilk()
        elif pilihan == '6':
            tampils()
        elif pilihan == '0':
            print("\nTerimakasih ^^\n")
            break
        else:
            print("Masukan dengan benar!")